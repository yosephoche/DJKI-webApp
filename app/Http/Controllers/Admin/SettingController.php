<?php

namespace App\Http\Controllers\Admin;
// use App\Category;
use App\Http\Controllers\Controller;
use DB, Session, GlobalClass;
use Illuminate\Http\Request;
use App\Settings;
use App\Archive;
use App\Posts;
use App\Pages;

class SettingController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index()
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		$data['setting'] = Settings::first();
		// $liputan_humas = Category::where('name', 'Liputan Humas')->first();
		// $info_terbaru = Category::where('name', 'Info terbaru')->first();
		// $data['url_posts'] = Posts::where('category', $liputan_humas->id)->orWhere('category', $info_terbaru->id)->get();
		$data['url_posts'] = Posts::all();
		$data['url_pages'] = Pages::all();
		$data['url_directory'] = Archive::all();
		return view('admin.setting.index', $data);
	}

	public function setText($id)
	{
		$post = Posts::where('slug', $id)->first();
		// $post = Posts::find($id);
		if (!isset($post)) {
			$pages = Pages::where('slug', $id)->first();
			// $pages = Pages::find($id);
			if (!isset($pages)) {
				$data = Archive::where('file', $id)->first();
			} else {
				$data = $pages;
			}
		} else {
			$data = $post;
		}
		return response()->json(['success' => true, 'data' => $data]);
	}

	public function update(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Validation*/
		$this->validate($r, [
			'meta_title' 		=> 'required',
			'meta_description'	=> 'required',
			'meta_keyword'		=> 'required',
			'timezone' 			=> 'required',
			'email' 			=> 'required|email',
			'phone' 			=> 'required'
		]);

		// $post = Posts::where('slug', $r->link)->first();
		// $post = Pages::where('slug', $r->link)->first();
		// $post = Archive::where('file', $r->link)->first();
		// dd($r->alamat);
		/*Maintenance Status*/
		$maintenance = '0';
		if ($r->maintenance == 'on') {
			$maintenance = '1';
		} else {
			$maintenance = '0';
		}

		// $foo = Posts::find($r->link);

		/*Update DB*/
		DB::update('update setting set meta_title = ?, meta_description = ?, meta_keyword = ?, timezone = ?, maintenance = ?, email = ?, phone = ?, facebook = ?, twitter = ?, google = ?, linkedin = ?, address = ?, youtube = ?, instagram = ?, running_text = ?, link = ?', [
			$r->meta_title,
			$r->meta_description,
			$r->meta_keyword,
			$r->timezone,
			$maintenance,
			$r->email,
			$r->phone,
			$r->facebook,
			$r->twitter,
			$r->google,
			$r->linkedin,
			$r->address,
			$r->youtube,
			$r->instagram,
			$r->running_text,
			$r->alamat,
			// $running_text->title,
			// "posts/" . $running_text->slug,
		]);

		/*OG Image*/
		if ($r->hasFile('og_image')) {
			/*Remove Old Image*/
			$old = DB::table('setting')->first();
			GlobalClass::removeFile([
				array(
					'path' => 'uploaded/setting',
					'files' => $old->og_image
				),
			]);

			/*Upload Images*/
			$file_name = GlobalClass::UploadImage([
				'file' => $r->file('og_image'), //file required
				'path' => 'uploaded/setting', //path required
				'width' => 500 //width optional
			]);

			/*Save DB*/
			DB::update('update setting set og_image = ?', [$file_name]);
		}

		/*Favicon*/
		$favicon = '';
		if ($r->hasFile('favicon')) {

			/*Remove Old Image*/
			$old = DB::table('setting')->first();
			GlobalClass::removeFile([
				array(
					'path' => 'uploaded/setting',
					'files' => $old->favicon
				),
			]);

			/*Upload Images*/
			$file_name = GlobalClass::UploadImage([
				'file' => $r->file('favicon'), //file required
				'path' => 'uploaded/setting', //path required
				'width' => 16 //width optional
			]);

			/*Save DB*/
			DB::update('update setting set favicon = ?', [$file_name]);
		}

		/*Logo*/
		if ($r->hasFile('logo')) {

			/*Remove Old Image*/
			$old = DB::table('setting')->first();
			GlobalClass::removeFile([
				array(
					'path' => 'uploaded/setting',
					'files' => $old->logo
				),
			]);

			/*Upload Images*/
			$file_name = GlobalClass::UploadImage([
				'file' => $r->file('logo'), //file required
				'path' => 'uploaded/setting', //path required
				'width' => 5 //width optional
			]);

			/*Save DB*/
			DB::update('update setting set logo = ?', [$file_name]);
		}

		/*Success Message*/
		Session::flash('message', "Successfully update.");
		return redirect()->back();
	}

	public function keytoken()
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		$token = bin2hex(openssl_random_pseudo_bytes(20));
		DB::update('update setting set key_token = ?', [$token]);
		Session::flash('message', "Successfully generate token.");
		return redirect()->back();
	}
}
