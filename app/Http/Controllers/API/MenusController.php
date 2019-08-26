<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Pages;
use App\Http\Controllers\Controller;

class MenusController extends Controller
{
  public function getMenus(Request $r, $idMenu = null)
  {
    if ($idMenu) {
      /* Kondisi ketika idMenu bernilai true, maka target query adalah submenu dan subsmenu */
      $countSubMenu = nav(['position' => 'header'])->where('parent', $idMenu);
      foreach ($countSubMenu as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id);
        $menus['response'][] = [
          'id_parent' => $parent->id,
          'title' => $parent->menu_title,
          'action_type' => $action['type'],
          'id_target' => $action['id'],
          'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
        ];
      }
    } else {
      /* Kondisi ketika idMenu bernilai false, maka target query adalah parent */
      foreach (nav(['position' => 'header'])->where('parent', '0')->where('lang', $r->lang) as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id);
        $slugs = str_replace(' ', '_', strtolower($parent->menu_title));
        $menus['response'][] = [
          'id_menu' => $parent->id,
          'description' => isset($parent->description) == false ? '' : $parent->description,
          'title' => $parent->menu_title,
          'action_type' => $action['type'],
          'id_target' => $action['id'],
          'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
        ];
      }
    }

    if (isset($menus) > 0) {
      $menus['diagnostic'] = [
        'code' => 200,
        'status' => 'ok'
      ];
      return response($menus, 200);
    }
    return response(
      [
        'diagnostic' => [
          'status' => 'NOT_FOUND',
          'code' => 404
        ]
      ],
      404
    );
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
