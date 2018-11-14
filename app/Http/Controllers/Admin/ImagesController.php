<?php

namespace App\Http\Controllers\Admin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Response;
use App\Http\Controllers\Controller;
use App\Images;
use App\Galleries;
use DB, GlobalClass;
use FroalaEditor\Image as FroalaEditor;


class ImagesController extends Controller
{

  public function index($id = null)
  {
    GlobalClass::Roleback(['Customer Service', 'Writer']);
    if ($id) {
      try
      {
        Galleries::findOrFail($id);
      }
      catch(ModelNotFoundException $e)
      {
        return redirect()->route('galleries');
      }
      $images = Images::where('id_albums', $id)->paginate(24);
    } else {
      $images = Images::paginate(24);
    }
    $data['images'] = $images;
    return view('admin.images.index',$data);
  }

  public function store(Request $r)
  {
    /*Validation*/
    $validatedData = $this->validate($r,[
      'filename'=>'max:5000'
    ]);

    /*Check params id albums*/
    $id_albums = str_replace(' ', '-', $r->id_albums);
    $id_albums = preg_replace('/[^0-9\-]/', '', $id_albums);

    /*Upload Images*/
    $file_name = GlobalClass::UploadImage([
      'file'=> $r->file('filename'), //file required
      'path'=> 'uploaded/media', //path required
      'width'=>700 //width optional
    ]);

    if(is_numeric($id_albums)) {

      /*Save database*/
      $images = new Images();
      $images->id_albums = $id_albums;
      $images->file_name = $file_name;
      $images->dir = 'media';
      $images->save();

    } else {

      /*Save database*/
      $images = new Images();
      $images->id_albums = 0;
      $images->file_name = $file_name;
      $images->dir = 'media';
      $images->save();

    }

    /*Response*/
    return Response::json([
        'message' =>'Image uploaded successfully'
    ], 200);
  }

  public function delete(Request $r)
  {
    GlobalClass::Roleback(['Customer Service', 'Writer']);

    /*Delete Data*/
		$old = Images::find($r->id);
    GlobalClass::removeFile([
      array(
        'path'=>'uploaded/media',
        'files'=>'sources-'.$old->file_name
      ),
      array(
        'path'=>'uploaded/media',
        'files'=>'thumb-'.$old->file_name
      ),
      array(
        'path'=>'uploaded/download',
        'files'=>$old->file_name
      )
    ]);

    Images::where('id', $r->id)->delete();

    /*Success Message*/
    $r->session()->flash('success', 'Galleries Successfully Deleted');
    return redirect()->back();
  }

  public function showImages() {
    $response = FroalaEditor::getList('uploaded/media/');
    $listImage = array();
    for ($i=0; $i < count($response); $i++) {
      $listImage[] = asset('uploaded/media/'.str_replace('thumb-','',$response[$i]->name));
    }
    for ($i=0; $i < count(array_unique($listImage)) ; $i++) {
      $finalRes[] = [
        'url'=>$listImage[$i],
        'thumb'=>$listImage[$i],
        'tag'=>$listImage[$i]
      ];
    }
    return response()->json($finalRes);
  }

  public function uploadImages(Request $r) {
    /*Upload Images*/
    $file_name = GlobalClass::UploadImage([
      'file'=> $r->file('file'), //file required
      'path'=> 'uploaded/media', //path required
      'width'=>700 //width optional
    ]);

    /*Save database*/
    $images = new Images();
    $images->id_albums = 0;
    $images->file_name = $file_name;
    $images->dir = 'media';
    $images->save();

    return response()->json(['link'=>asset('uploaded/media/'.$file_name)]);
  }
}
