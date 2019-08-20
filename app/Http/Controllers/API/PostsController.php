<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Posts;
use App\Comments;
use App\Category;
use DB;
use Carbon;
use GlobalClass;

class PostsController extends Controller
{
  public function getPosts(Request $r)
  {
    /* Data Master */
    $dataPosts = Posts::where('category', $r->query('category'))
      ->where('status', 'publish')
      ->where('lang', $r->query('lang'))
      ->where('published', '<=', \DB::raw('now()'))
      ->orderBy('published', 'DESC')
      ->paginate(20);
    /* Paginate  */
    $posts = $this->paging($dataPosts);

    /* Data Posts */
    foreach ($dataPosts->items() as $key => $value) {
      $posts['response'][] = [
        'title' => $value->title,
        'content' => readMore(['text' => $value->content, 'limit' => 150]),
        'image' => GlobalClass::setImages($value->image) == 'default.jpg' ? '' : asset('uploaded/media/' . GlobalClass::setImages($value->image)),
        'published' => Carbon\Carbon::parse($value->published)->format('d F Y'),
        'category' => $value->category == true ? Category::where('id', $value->category)->first()->name : '',
        'id_target' => $value->id
      ];
    }
    if (isset($posts['response'])) {
      $posts['diagnostic'] = [
        'code' => 200,
        'status' => 'ok'
      ];
      return response($posts, 200);
    }
    return response([
      'diagnostic' => [
        'status' => 'NOT_FOUND',
        'code' => 404
      ]
    ], 404);
  }

  public function postComments(Request $r)
  {
    $postComment = Comments::create([
      'id_user'   => $r->iduser,
      'id_parent' => $r->idparent,
      'id_posts'  => $r->idpost,
      'comment'   => $r->comment,
    ]);

    if ($postComment == TRUE) {
      return response([
        'diagnostic' => [
          'status' => 'OK',
          'code' => 200
        ]
      ], 200);
    } else {
      return response([
        'diagnostic' => [
          'status' => 'NOT_FOUND',
          'code' => 404
        ]
      ], 404);
    }
  }
  public function detailsPost($idPosts = null)
  {
    /* Data Master */
    $dataPosts = Posts::where('id', $idPosts)
      ->where('status', 'publish')
      ->where('published', '<=', \DB::raw('now()'))->first();

    /* Data Posts */
    if ($dataPosts == true) {
      $images = json_decode($dataPosts->image);
      for ($i = 0; $i < count($images); $i++) {
        switch ($images[$i]) {
          case 'default.jpg':
            $arrImages = [];
            break;
          default:
            $arrImages[] = asset('uploaded/media/' . $images[$i]);
            break;
        }
      }
      $posts['response'] = [
        'id' => $dataPosts->id,
        'title' => $dataPosts->title,
        'image' => $arrImages,
        'published' => Carbon\Carbon::parse($dataPosts->published)->format('d F Y'),
        'category' => $dataPosts->category == true ? Category::where('id', $dataPosts->category)->first()->name : '',
        'content_uri' => route('front_blog_detail', ['id' => $dataPosts->id, 'slug' => $dataPosts->slug])
      ];
      if (isset($posts['response'])) {
        $posts['diagnostic'] = [
          'code' => 200,
          'status' => 'ok'
        ];
        return response($posts, 200);
      }
    }
    return response([
      'diagnostic' => [
        'status' => 'NOT_FOUND',
        'code' => 404
      ]
    ], 404);
    return response([
      'diagnostic' => [
        'status' => 'NOT_FOUND',
        'code' => 404
      ]
    ], 404);
  }

  public function paging($raw)
  {
    $object = new \stdClass;
    $object->total = $raw->total();
    $object->per_page = $raw->perPage();
    $object->current_page = $raw->currentPage();
    $object->last_page = $raw->lastPage();
    $object->from = $raw->firstItem();
    $object->to = $raw->lastItem();
    return [
      'pagination' => $object
    ];
  }
}
