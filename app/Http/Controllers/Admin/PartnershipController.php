<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Partnership, App\Images;
use DB, GlobalClass;

class PartnershipController extends Controller
{

    public function index()
    {
        $partnership = Partnership::all();
        return view('admin.partnership.index', compact('partnership'));
    }

    public function create()
    {
        return view('admin.partnership.create');
    }

    public function store(Request $r)
    {
        $this->validate($r, [
            'title' => 'required',
            'image'  => 'required|mimes:jpeg,png,jpg',
            'link'  => 'required',
        ]);

        /* Upload */
        $filename = GlobalClass::UploadFile([
            'path' => 'uploaded/partner',
            'files' => $r->file('image')
        ]);

        $data = array(
            'title'     => $r->title,
            'image'     => $filename,
            'link'      => $r->link
        );

        $partnership = new Partnership();
        $partnership->insert($data);

        $r->session()->flash('success', 'Partnership Successfully Added');
        return redirect()->route('partnership-index');
    }

    public function edit($id)
    {
        //
        $partnership = Partnership::find($id);
        return view('admin.partnership.edit', compact('partnership'));
    }

    public function update(Request $r, $id)
    {
        GlobalClass::Roleback(['Customer Service']);
        $partnership = Partnership::find($id);
        if ($r->image) {
            $this->validate($r, [
                'title' => 'required|max:100',
                'image'  => 'required|mimes:jpeg,png,jpg',
                'link'  =>  'required',
            ]);

            /* Remove old files */
            $old = DB::table('partnership')->where('id', $id)->first();
            Images::where('file_name', $old->image)->delete();
            GlobalClass::removeFile([
                array(
                    'path' => 'uploaded/partner',
                    'files' => $old->image
                ),
            ]);

            /* Upload */
            $filename = GlobalClass::UploadFile([
                'path' => 'uploaded/partner',
                'files' => $r->file('image')
            ]);

            /* Save DB */
            $images = new Images();
            $images->id_albums = 0;
            $images->file_name = $filename;
            $images->dir = 'download';
            $images->save();

            $partnership->image = $filename;
        }

        $partnership->title = $r->title;
        $partnership->link  = $r->link;

        $partnership->update();

        /*Success Message*/
        $r->session()->flash('success', 'Partnership Successfully Update');
        return redirect()->route('partnership-index');
    }

    public function destroy(Request $r)
    {
        //
        GlobalClass::Roleback(['Customer Service']);

        /* Remove old files */
        $old = DB::table('partnership')->where('id', $r->id)->first();
        Images::where('file_name', $old->image)->delete();
        GlobalClass::removeFile([
            array(
                'path' => 'uploaded/partner',
                'files' => $old->image
            ),
        ]);

        Partnership::where('id', $r->id)->delete();
        $r->session()->flash('success', 'Partnership Successfully Delete');
        return redirect()->route('partnership-index');
    }
}
