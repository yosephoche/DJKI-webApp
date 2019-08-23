<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use App\Slideshow;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB, GlobalClass;
use App\Pages;

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
    	return view('admin.slideshow.create',compact('pages'));
    }

    public function store(Request $r)
    {
			GlobalClass::Roleback(['Customer Service', 'Writer']);

	  	/*Validation Store*/
			$this->validate($r,[
				'title'=>'required',
				'desc'=>'required|max:80',
				'image'=>'required',
				'category'=>'required'
			]);

			$count = DB::table('pages_slide')->count();
			if ($count > 0) {
				$sort = DB::table('pages_slide')->select('sort')->orderBy('sort', 'DESC')->first();
			} else {
				$sort = $count;
			}

			$slideshow = new Slideshow();

			/*Save DB*/
			$slideshow->title = $r->title;
			$slideshow->desc = $r->desc;
			$slideshow->link = $r->link;
			$slideshow->category = $r->category;
			$slideshow->sort = $count > 0 ? $sort->sort + 1 : $sort + 1;
			$slideshow->image = $r->image;
			$slideshow->save();

			/*Success Message*/
			$r->session()->flash('success', 'Slideshow Successfully Added');
			return redirect(route('slideshow'));
    }

    public function edit($id)
    {
			GlobalClass::Roleback(['Customer Service', 'Writer']);
			
			try
			{
				$pages = Pages::all();
		    $slideshow = Slideshow::findOrFail($id);
				$data['slideshow'] = $slideshow;
				
				return view('admin.slideshow.edit', $data,compact('pages'));
			}
			catch(ModelNotFoundException $e)
			{
		    return redirect()->route('slideshow');
			}
    }

    public function update($id, Request $r)
    {
			GlobalClass::Roleback(['Customer Service', 'Writer']);

	    /*Validation Update*/
			$this->validate($r,[
				'title'=>'required',
				'desc'=>'required|max:80',
				'image'=>'required',
				'category'=>'required'
			]);

			$count = DB::table('pages_slide')->count();
			if ($count > 0) {
				$sort = DB::table('pages_slide')->select('sort')->orderBy('sort', 'DESC')->first();
			}

			$slideshow = Slideshow::find($id);

			/*Save to DB*/
			$slideshow->image = $r->image;
			$slideshow->title = $r->title;
			$slideshow->desc = $r->desc;
			$slideshow->link = $r->link;
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
