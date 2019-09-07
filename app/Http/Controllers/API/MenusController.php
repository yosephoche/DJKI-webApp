<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Pages;
use App\Http\Controllers\Controller;
use App\Settings;
use App\Slideshow;
use App\MenuHorizontal;
use General, Response;

class MenusController extends Controller
{

  public function __construct()
  {
    $this->helper = new General;
    $this->response = new Response;
  }

  public function getMenus(Request $r)
  {
    if ($r->id_menu) {
      /* Kondisi ketika idMenu bernilai true, maka target query adalah submenu dan subsmenu */
      $menu = nav(['position' => 'header'])->where('parent', $r->id_menu);
      foreach ($menu as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id);
        $menus[] = [
          'id_parent' => $parent->id,
          'title_ID' => $parent->menu_title,
          'title_EN' => $parent->menu_title_en,
          'action_type' => $action['type'],
          'id_target' => $action['id'],
          'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
        ];
      }
    } else {
      $menu = nav(['position' => 'header'])->where('parent', '0');
      $running_text = Settings::whereNotNull('running_text')->first();
      $slide1 = Slideshow::where('category', 'Home')->orderBy('sort', 'DESC')->get();
      $horizontal = MenuHorizontal::all();
      // $slide1 = Slideshow::orderBy('sort', 'DESC')->where('category', 'Home');
      // dd($running_text->link);
      /* Kondisi ketika idMenu bernilai false, maka target query adalah parent */
      $menus['pinned'] = [
        'running_text' => $running_text->running_text,
        'link' => $running_text->link,
        'facebook' => $running_text->facebook,
        'twitter' => $running_text->twitter,
        'google' => $running_text->google,
        'linkedlin' => $running_text->linkedin,
        'youtube' => $running_text->youtube,
        'instagram' => $running_text->instagram,
      ];

      foreach ($slide1 as $key => $value) {
        $menus['slideshow'][] = [
          'id_slide' => $value->id,
          'title' => $value->title,
          'image' => asset('uploaded/media/' . $value->image),
          'link' => $value->link
        ];
      }

      foreach ($horizontal as $key => $n) {
        $menus['menu_horizontal'][] = [
          'id_menu' => $n->id,
          'menu_title_id' => $n->menu_title_id,
          'menu_title_en' => $n->menu_title_en,
          'url'   => $n->url,
          'image' => $n->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $n->image)
        ];
      }

      foreach ($menu as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id);
        $slugs = str_replace(' ', '_', strtolower($parent->menu_title));
        $menus['menus'][] = [
          'id_menu' => $parent->id,
          'description_ID' => isset($parent->description) == false ? '' : $parent->description,
          'description_EN' => isset($parent->description_EN) == false ? '' : $parent->description_EN,
          'title_ID' => $parent->menu_title,
          'title_EN' => $parent->menu_title_en,
          'action_type' => $action['type'],
          'id_target' => $action['id'],
          'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
        ];
      }
    }

    if ($menu->isNotEmpty()) {
      $response = $this->response->formatResponseWithPages("OK", $menus, $this->response->STAT_OK());
      $headers = $this->response->HEADERS_REQUIRED('GET');
      return response()->json($response, $this->response->STAT_OK());
    } else {
      $headers = $this->response->HEADERS_REQUIRED('GET');
      $response = $this->response->formatResponseWithPages("POST NOT FOUND", [], $this->response->STAT_NOT_FOUND());
      return response()->json($response, $this->response->STAT_NOT_FOUND());
    }
    // if (isset($menus) > 0) {
    //   $menus['diagnostic'] = [
    //     'code' => 200,
    //     'status' => 'ok'
    //   ];
    //   return response($menus, 200);
    // }
    // return response(
    //   [
    //     'diagnostic' => [
    //       'status' => 'NOT_FOUND',
    //       'code' => 404
    //     ]
    //   ],
    //   404
    // );
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
