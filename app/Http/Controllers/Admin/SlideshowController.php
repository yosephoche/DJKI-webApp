<?php

namespace App\Http\Controllers\Admin;

use App\Category;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Slideshow;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB, GlobalClass;
use App\Pages;
use Illuminate\Support\Str;

class SlideshowController extends Controller
{
	public function __construct()
	{
		$this->middleware('auth');
	}

	public function index()
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		$data['slideshow'] = DB::table('pages_slide')->get();
		return view('admin.slideshow.index', $data);
	}

	public function create()
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);
		$pages = Pages::all();
		return view('admin.slideshow.create', compact('pages'));
	}

	public function store(Request $r)
	{
		// dd($r);
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Validation Store*/
		if ($r->inputan == 1) {
			$this->validate($r, [
				'title' => 'required',
				'image' => 'required',
				'category' => 'required',
				// 'link'	=> 'required'

			]);
		} else if ($r->inputan == 2) {
			$this->validate($r, [
				'category' => 'required',
				'linkvid'	=> 'required'
			]);
		} else {
			$this->validate($r, [
				'inputan'	=> 'required'
			]);
		}

		$count = DB::table('pages_slide')->count();
		if ($count > 0) {
			$sort = DB::table('pages_slide')->select('sort')->orderBy('sort', 'DESC')->first();
		} else {
			$sort = $count;
		}

		$slideshow = new Slideshow();

		/*Save DB*/
		if (!isset($r->link)) {
			$slideshow->title = $r->title;
			$slideshow->link = $r->link;
			$slideshow->image = $r->image;
		} else {
			$slideshow->title = $r->linkvid;
			$slideshow->link = $r->linkvid;
		}
		$slideshow->id_inputan = $r->inputan;
		$slideshow->category = $r->category;
		$slideshow->sort = $count > 0 ? $sort->sort + 1 : $sort + 1;

		$slideshow->save();

		/*Success Message*/
		$r->session()->flash('success', 'Slideshow Successfully Added');
		return redirect(route('slideshow'));
	}

	public function edit($id)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		try {
			$pages = Pages::all();
			$slideshow = Slideshow::findOrFail($id);
			$str = Str::after($slideshow->link, 'watch?v=');
			$data['slideshow'] = $slideshow;

			return view('admin.slideshow.edit', $data, compact('pages', 'str'));
		} catch (ModelNotFoundException $e) {
			return redirect()->route('slideshow');
		}
	}

	public function update($id, Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Validation Update*/
		if ($r->inputan == 1) {
			$this->validate($r, [
				'title' => 'required',
				'image' => 'required',
				'category' => 'required',
				'link'	=> 'required'

			]);
		} else if ($r->inputan == 2) {
			$this->validate($r, [
				'category' => 'required',
				'linkvid'	=> 'required'
			]);
		}

		$count = DB::table('pages_slide')->count();
		if ($count > 0) {
			$sort = DB::table('pages_slide')->select('sort')->orderBy('sort', 'DESC')->first();
		}

		$slideshow = Slideshow::find($id);

		/*Save to DB*/
		if ($r->link == true) {
			$slideshow->title = $r->title;
			$slideshow->link = $r->link;
			$slideshow->image = $r->image;
		} else {
			$slideshow->title = $r->linkvid;
			$slideshow->link = $r->linkvid;
		}
		$slideshow->category = $r->category;
		$slideshow->sort = $sort->sort + 1;

		$slideshow->save();

		/*Success Message*/
		$r->session()->flash('success', 'Slideshow Successfully Modified');
		return redirect(route('slideshow'));
	}

	public function delete(Request $r)
	{
		GlobalClass::Roleback(['Customer Service', 'Writer']);

		/*Delete Data*/
		Slideshow::where('id', $r->id)->delete();

		/*Success Message*/
		$r->session()->flash('success', 'Slideshow Successfully Deleted');
		return redirect(route('slideshow'));
	}
}
