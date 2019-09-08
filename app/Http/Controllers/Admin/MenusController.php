<?php

namespace App\Http\Controllers\Admin;

use App\Menus;
use App\Posts;
use App\Pages;
use App\Category;
use App\ArchiveGroup;
use App\Archive;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB, GlobalClass;
use PhpParser\Node\Stmt\If_;

class MenusController extends Controller
{

	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index($option = null)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Check params header or footer*/
		switch ($option) {
			case 'header':
				$menusHeader = Menus::where('status', 'header')
					->where('url', 'not like', '%post%')
					->where('url', 'not like', '%page%')
					->where('url', 'not like', '%directory%')
					->orderBy('sort')->get();
				
				$data['menus'] = Menus::where('parent', '0');

				/* Mencari subsparent */
				$listMenus = array();

				/** jangan kyak gini bikin variable
				 * kasih jelas namanya variable ksih jelas 
				 * sesuai kegunaannya utk tampung data apa*/
				$listMenus2 = [];
				
				foreach ($menusHeader->where('parent', '0') as $key => $value) {
					$url = $value->url;

					if (preg_match("^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$^", $url) == 0) {
						$listMenus[] = $menusHeader->where('parent', $value->id);
						$listMenus2[] = $value;
					}
				}
				$data['listUpdate'] = $listMenus;
				$data['listHeader'] = $listMenus2; 
				break;
			case 'footer':
				$menus = Menus::where('status', 'footer')->orderBy('sort')->get();
				$data['menus'] = $menus->where('parent', '0');

				/* Mencari subsparent */
				$listMenus = array();
				$listMenus = array();
				foreach ($menus->where('parent', '0') as $key => $value) {
					$listMenus[] = $menus->where('parent', $value->id);
				}
				$data['listUpdate'] = $listMenus;
				break;
			default:
				/*if params not valid*/
				return abort(404);
				break;
		}
		/*Data posts and pages*/
		$data['url_pages'] = Pages::where('deleted_at', null)->orderBy('title')->get();
		$data['category'] = Category::all();
		$data['archive'] = ArchiveGroup::all();
		// $data['archive_item'] = Archive::all();
		return view('admin.menus.index', $data);
	}

	public function store(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Validation*/
		$this->validate($r, [
			'option' => 'required',
			'menu_title' => 'required',
			// 'url' => 'required'
		]);

		$tabMenus = new Menus;
		if ($r->hasFile('image')) {

			/*Upload Images*/
			$file_name = GlobalClass::UploadImage([
				'file' => $r->file('image'), //file required
				'path' => 'uploaded/menus', //path required
				'width' => 500 //width optional
			]);
			$tabMenus->image = $file_name;
		} else {
			$tabMenus->image = 'default.jpg';
		}

		/*Check params header or footer*/
		if (in_array($r->option, array('header', 'footer'))) {
			/*Insert into table*/
			$tabMenus->menu_title = $r->menu_title;
			$tabMenus->menu_title = $r->menu_title;
			if (strlen($r->menu_titleEN) > 0) {
				$tabMenus->menu_title_EN = $r->menu_titleEN;
			} else {
				$tabMenus->menu_title_EN = $r->menu_title;
			}
			$tabMenus->parent = $r->parent;
			$tabMenus->status = $r->option;
			$tabMenus->flag = $r->flag;
			if ($r->flag == 1) {
				$tabMenus->url = "#";
			} else {
				$tabMenus->url = $r->url;
			}

			$tabMenus->save();
			$r->session()->flash('success', 'Menu Successfully Added');
		} else {
			$r->session()->flash('success', 'Menu Not Added');
		}
		return redirect()->back();
	}

	public function update(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		/*Validation*/
		$this->validate($r, [
			'id' => 'required',
			'menu_title' => 'required',
			'url' => 'required'
		]);

		$tabMenus = Menus::find($r->id);

		if ($r->hasFile('image')) {

			/*Remove Old Image*/
			$old = DB::table('menus')->where('id', $r->id)->first();
			GlobalClass::removeFile([
				array(
					'path' => 'uploaded/menus',
					'files' => $old->image
				),
			]);

			/*Upload Images*/
			$file_name = GlobalClass::UploadImage([
				'file' => $r->file('image'), //file required
				'path' => 'uploaded/menus', //path required
				'width' => 500 //width optional
			]);

			$tabMenus->image = $file_name;
		}

		/*Update data*/
		$tabMenus->menu_title = $r->menu_title;
		if (strlen($r->menu_titleEN) > 0) {
			$tabMenus->menu_title_EN = $r->menu_titleEN;
		} else {
			$tabMenus->menu_title_EN = $r->menu_title;
		}
		$tabMenus->url = $r->url;
		$tabMenus->parent = $r->parent;
		$tabMenus->description = $r->description;
		if (strlen($r->descriptionEN) > 0) {
			$tabMenus->description_EN = $r->descriptionEN;
		} else {
			$tabMenus->description_EN = $r->description;
		}
		$tabMenus->update();

		/*Success Message*/
		$r->session()->flash('success', 'Menu Successfully Modified');

		return redirect(url()->previous());
	}

	public function delete(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Delete Data*/
		$tabMenus = new Menus;
		if ($tabMenus::where('parent', $r->id)->count() > 0) {
			/*Failed Message*/
			$r->session()->flash('success', 'Please delete sub menu');
		} else {
			$tabMenus::find($r->id)->delete();
			/*Success Message*/
			$r->session()->flash('success', 'Menu Successfully Deleted');
		}
		return redirect(url()->previous());
	}

	public function drag(Request $r)
	{
		// dd($r->all());
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		$tabMenus = new Menus;
		$data['id'] = explode(',', $r->id_menus);
		$data['type'] = explode(',', $r->type);

		$menus = Menus::whereIn('id', explode(',', $r->id_menus))->get()->map(function ($value, $key) use ($data) {
			$id = $value->id;
			$type = $data['type'][$key];
			$url = $value->url;
			$sort = array_search($value->id, $data['id']);

			return ['id' => $id, 'type' => $type, 'url' => $url, 'sort' => $sort];
		});
		// dd($r->all(), $menus);

		// dd($menus);
		/*Update data*/
		foreach ($menus as $key => $value) {
			// dd($value);
			if ($value['type'] == 'menu') {
				$parent = $value;
				$tabMenus::where('id', $value['id'])
					->update([
						'sort' => $value['sort'],
						'parent' => "0",
					]);
			} elseif ($value['type'] == 'submenu') {
				if (
					strpos($parent['url'], 'post')
					|| preg_match("^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$^", $parent['url'])
					|| strpos($parent['url'], 'page')
					|| strpos($parent['url'], 'directory')
				) { } else {
					$tabMenus::where('id', $value['id'])
						->update([
							'sort' => $value['sort'],
							'parent' => $parent['id'],
						]);
					$parentSubmenu = $value;
				}
				// dd($parent, $value);
			} else {
				if (
					strpos($parent['url'], 'post')
					|| preg_match("^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$^", $parent['url'])
					|| strpos($parent['url'], 'page')
					|| strpos($parent['url'], 'directory')
				) { } else {
					$tabMenus::where('id', $value['id'])
						->update([
							'sort' => $value['sort'],
							'parent' => $parentSubmenu['id'],
						]);
				}
			}
		}

		/*Success Message*/
		$r->session()->flash('success', 'Menu Successfully Modified');
		return redirect(url()->previous());
	}

	public function listMenu()
	{
		$pages = Pages::where('deleted_at', null)->orderBy('title')->get();
		$category = Category::all();
		$archiveGroup = ArchiveGroup::all();
		$archive = Archive::all();
		$menus = Menus::where('status', 'header')->orderBy('sort')->get();
		$baseURL = url('/');

		/* Menu parent */
		foreach ($menus->where('parent', '0') as $key => $value) {
			$action = $this->getAction($value->url, $value->id);
			$id = $action['id'] == null ? $value->id : $action['id'];
			$desc = $value->description == null ? 'null/' : rawurlencode($value->description) . '/';
			if ($action['type'] == 'menu') {
				$listMenu[] = [
					'text' => $value->menu_title,
					'href' => $baseURL . '/menu/' . rawurlencode($value->menu_title) . '/' . $desc . $action['type'] . '/' . $id
				];
			} else {
				$listMenu[] = [
					'text' => $value->menu_title,
					'href' => $baseURL . '/menu/' . rawurlencode($value->menu_title) . '/' . $action['type'] . '/' . $id
				];
			}
			foreach ($menus->where('parent', $value->id) as $submenu) {
				$action = $this->getAction($submenu->url, $submenu->id);
				$desc = $submenu->description == null ? 'null/' : rawurlencode($submenu->description) . '/';
				$idsub = $action['id'] == null ? $submenu->id : $action['id'];
				if ($action['type'] == 'menu') {
					$listMenu[] = [
						'text' => $submenu->menu_title,
						'href' => $baseURL . '/menu/' . rawurlencode($submenu->menu_title) . '/' . $desc . $action['type'] . '/' . $idsub
					];
				} else {
					$listMenu[] = [
						'text' => $submenu->menu_title,
						'href' => $baseURL . '/menu/' . rawurlencode($submenu->menu_title) . '/' . $action['type'] . '/' . $idsub
					];
				}
			}
		}

		/* Pages */
		foreach ($pages as $key => $value) {
			$listMenu[] = [
				'text' => $value->title,
				'href' => $baseURL . '/page/' . $value->slug . '/' . $value->id
			];
		}

		/* Category */
		foreach ($category as $key => $value) {
			$listMenu[] = [
				'text' => $value->name,
				'href' => $baseURL . '/categori/' . $value->slug . '/' . $value->id
			];
		}

		/* Archive Group */
		foreach ($archiveGroup as $key => $value) {
			$listMenu[] = [
				'text' => $value->name,
				'href' => $baseURL . '/directory/' . $value->slug . '/' . $value->id
			];
		}

		/* Archive */
		foreach ($archive as $key => $value) {
			$listMenu[] = [
				'text' => $value->title,
				'href' => asset('uploaded/download/' . $value->file)
			];
		}

		return response()->json($listMenu);
	}

	public function getAction($url, $parentID)
	{
		$checkPages = explode('/page/', $url);
		$checkPosts = explode('/post/category/', $url);
		$checkArchive = explode('/directory/', $url);
		if (isset($checkPages['1'])) {
			/* Kondisi jika url memiliki pages */
			$getPages = Pages::where('slug', $checkPages['1'])->first();
			$countSubMenu = nav(['position' => 'header'])->where('parent', $parentID);
			if (isset($getPages)) {
				if ($countSubMenu->count() > 0) {
					$res = [
						'type' => 'pages_with_menu',
						'id' => $getPages->id == null ? '' : "$getPages->id"
					];
				} else {
					$res = [
						'type' => 'pages',
						'id' => $getPages->id == null ? '' : "$getPages->id"
					];
				}
			} else {
				$res = [
					'type' => '',
					'id' => ''
				];
			}
			return $res;
		} elseif (isset($checkPosts['1'])) {
			/* Kondisi jika url memiliki posts */
			$categoryID = explode('/', $checkPosts['1'])[1];
			$countSubMenu = nav(['position' => 'header'])->where('parent', $parentID);
			if ($countSubMenu->count() > 0) {
				$res = [
					'type' => 'posts_with_menu',
					'id' => $categoryID
				];
			} else {
				$res = [
					'type' => 'posts',
					'id' => $categoryID
				];
			}
			return $res;
		} elseif (isset($checkArchive[1])) {
			/* Kondisi jika url memiliki archive */
			$archiveID = explode('/', $checkArchive['1'])[1];
			$countSubMenu = nav(['position' => 'header'])->where('parent', $parentID);
			if ($countSubMenu->count() > 0) {
				$res = [
					'type' => 'directory_with_menu',
					'id' => $archiveID
				];
			} else {
				$res = [
					'type' => 'directory',
					'id' => $archiveID
				];
			}
			return $res;
		} elseif ($parentID) {
			/* Kondisi jika url tidak memiliki initial maka akan mengecek parentID */
			$countSubMenu = nav(['position' => 'header'])->where('parent', $parentID);
			if ($countSubMenu->count() > 0) {
				/* Jika parent memiliki child */
				$res = [
					'type' => 'menu',
					'id' => ''
				];
			} elseif ($url == '#') {
				/* Jika menu menuju external link */
				$res = [
					'type' => '',
					'id' => $url
				];
			} else {
				/* Jika menu menuju external link */
				$res = [
					'type' => 'link',
					'id' => $url
				];
			}
			return $res;
		}
	}
}
