<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Maps;

class MapsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        $maps = Maps::paginate(10);
        return view('admin.maps.index',compact('maps'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view('admin.maps.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        $this->validate($request,[
            'longitude'=>'required',
            'latitude'=>'required'
          ]);

          $maps = new Maps;
          $maps->longitude = $request->longitude;
          $maps->latitude  = $request->latitude;

          $maps->save();
          $request->session()->flash('success', 'Maps Successfully Added');
          return redirect()->route('maps-index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        $maps = Maps::find($id);

        return view('admin.maps.edit',compact('maps'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        $this->validate($request,[
            'longitude'=>'required',
            'latitude'=>'required'
          ]);

          $maps = Maps::findOrFail($id);
          $maps->longitude = $request->longitude;
          $maps->latitude  = $request->latitude;

          $maps->save();
          $request->session()->flash('success', 'Maps Successfully Update');
          return redirect()->route('maps-index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $r)
    {
        //
        Maps::where('id',$r->id)->delete();
        $r->session()->flash('success', 'Maps Successfully Delete');
        return redirect()->route('maps-index');
    }
}
