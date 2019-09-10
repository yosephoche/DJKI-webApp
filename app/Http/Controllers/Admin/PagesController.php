<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Pages, App\User, App\Images, App\Category;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB, GlobalClass, TemplateModule;

class PagesController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		if ($r->has('key')) {
			$key = $r->key;
		} else {
			$key = '';
		}
		$data['pages'] = DB::table('pages')->where('title', 'like', '%' . $key . '%')->where('deleted_at', null)->paginate(10);
		return view('admin.pages.index', $data);
	}

	public function create()
	{
		/* Get static page already support theme */
		$data['static'] = TemplateModule::staticPage();

		/*Category*/
		$data['categories'] = Category::get();

		return view('admin.pages.create', $data);
	}

	public function store(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		$r->session()->flash('listImages', $r->image);

		/*Validation Store*/
		$this->validate($r, [
			'title' => 'required',
			'content' => 'required',
			'type' => 'max:100',
			'category' => 'max:10'
		]);

		/*Make Slug*/
		$slug = str_slug($r->title, "-");

		/*check to see if any other slugs exist that are the same & count them*/
		$count = DB::table('pages')->whereRaw("slug RLIKE '^{$slug}(-[0-9]+)?$'")->count();

		$pages = new Pages();

		if (isset($r->image)) {
			$pages->image = json_encode($r->image);
		} else {
			$pages->image = json_encode(array('default.jpg'));
		}

		$pages->id_user = $r->id_user;
		$pages->slug = $count ? "{$slug}-{$count}" : $slug;
		$pages->title = $r->title;
		if ($r->titleEN) {
			$pages->title_en = $r->titleEN;
		} else {
			$pages->title_en = $r->title;
		}
		$pages->content = $r->content;
		if (strlen($r->contentEN) > 0) {
			$pages->content_en = $r->contentEN;
		} else {
			$pages->content_en = $r->content;
		}
		$pages->keyword = $r->keyword;
		$pages->type = $r->type;
		$pages->category = 'default';
		$pages->save();

		/*Success Message*/
		$r->session()->flash('success', 'Pages Successfully Added');
		return redirect(route('pages'));
	}

	public function edit($id)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		try {
			$pages = Pages::findOrFail($id);
			$ext = explode('.', $pages->image);
			if ($ext[1] == 'pdf') {
				$data['size'] = GlobalClass::formatSizeUnits(filesize(public_path('uploaded/media/' . $pages->image)));
			}
			$data['pages'] = $pages;

			/* Get static page already support theme */
			$data['static'] = TemplateModule::staticPage();

			/*Category*/
			$data['categories'] = Category::get();

			return view('admin.pages.edit', $data);
		} catch (ModelNotFoundException $e) {
			return redirect()->route('pages');
		}
	}

	public function update($id, Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Validation Update*/
		$this->validate($r, [
			'title' => 'required',
			'content' => 'required',
			'type' => 'max:100',
			'category' => 'max:10'
		]);

		/*Make Slug*/
		$slug = str_slug($r->title, "-");

		/*check to see if any other slugs exist that are the same & count them*/
		$count = DB::table('pages')->where('id', '!=', $id)->where('slug', $slug)->count();
		if ($count > 0) {
			$count = DB::table('pages')->where('id', '!=', $id)->where('slug', 'LIKE', $slug . '%')->count();
		}

		$pages = Pages::find($id);

		if (isset($r->image)) {
			$pages->image = json_encode($r->image);
		} else {
			$pages->image = json_encode(array('default.jpg'));
		}

		/*Save DB*/
		$pages->id_user = $r->id_user;
		$pages->slug = $count > 0 ? $slug . "-" . $count : $slug;
		$pages->title = $r->title;
		if (strlen($r->titleEN) > 0) {
			$pages->title_en = $r->titleEN;
		} else {
			$pages->title_en = $r->title;
		}
		$pages->content = $r->content;
		if (strlen($r->contentEN) > 0) {
			$pages->content_en = $r->contentEN;
		} else {
			$pages->content_en = $r->content;
		}
		$pages->keyword = $r->keyword;
		$pages->type = $r->type;
		$pages->category = 'default';
		$pages->save();

		/*Success Message*/
		$r->session()->flash('success', 'Pages Successfully Modified');
		return redirect(route('pages'));
	}

	public function detail($slug)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		try {
			/*Relation Pages with Users*/
			$pages = Pages::join('users', 'pages.id_user', '=', 'users.id')
				->select('pages.*', 'users.fullname')
				->orderBy('created_at', 'title')
				->where('slug', $slug)
				->firstOrFail();
			$data['pages'] = $pages;

			/*Recent Post*/
			$recent = DB::table('pages')->where('deleted_at', null)->get();
			$data['recent'] = $recent;
			return view('admin.pages.detail', $data);
		} catch (ModelNotFoundException $e) {
			return redirect()->route('pages');
		}
	}

	public function delete(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Delete Data*/
		$old = Pages::where('id', $r->id)->first();
		$old->delete();

		/*Success Message*/
		$r->session()->flash('success', 'Pages Successfully Deleted');
		return redirect(route('pages'));
	}
}
