<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Pages;
use App\Http\Controllers\Controller;
use App\MenuHorizontal;
use App\Settings;
use App\Slideshow;
use App\Menus;
use General, Response, DB;

class MenusController extends Controller
{

  public function __construct()
  {
    $this->helper = new General;
    $this->response = new Response;
  }

  public function getMenus(Request $r)
  {
    // $action_type = Menus::all();
    // $visitor = Menus::where('flag', 2)->first();
    // $contact = Menus::where('flag', 3)->first();
    if ($r->id_menu) {
      /* Kondisi ketika idMenu bernilai true, maka target query adalah submenu dan subsmenu */
      $menu = nav(['position' => 'header'])->where('parent', $r->id_menu);
      foreach ($menu as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id, $parent->flag);
        $menus[] = [
          'id_parent' => $parent->id,
          'title_id' => $parent->menu_title,
          'title_en' => $parent->menu_title_en,
          'action_type' => $action['type'],
          'id_target' => $action['id'],
          'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
        ];
      }
    } else {
      $menu = nav(['position' => 'header'])->where('parent', '0');
      $running_text = Settings::whereNotNull('running_text')->first();
      $slideshow = Slideshow::orderBy('sort', 'DESC')->where('category', 'Home');
      $horizontal = MenuHorizontal::all();
      $menus = [
        'pinned' => [],
        'slideshow' => [],
        'menu_horizontal' => [],
        'menus' => [],
      ];
      /* Kondisi ketika idMenu bernilai false, maka target query adalah parent */
      $getSplitLink = explode("/", $running_text->link);
      $dataSplitLink = array();
      $linkAfterSplit = "";
      if (count($getSplitLink) == 2) {
        $dataSplitLink = $getSplitLink;
      } else {
        $dataSplitLink = array("", $running_text->link);
      }
      if ($dataSplitLink[0] == "directory") {
        $linkAfterSplit = "uploaded/download/" . $dataSplitLink[1];
      } else {
        $linkAfterSplit = $dataSplitLink[1];
      }
      
      $menus['pinned'] = [
        'running_text' => $running_text->running_text,
        'action_type' => $dataSplitLink[0],
        'link' => $linkAfterSplit,
        'facebook' => $running_text->facebook,
        'twitter' => $running_text->twitter,
        'linkedlin' => $running_text->linkedin,
        'youtube' => $running_text->youtube,
        'instagram' => $running_text->instagram,
      ];

      foreach ($slideshow->get() as $key => $value) {
        if ($value->id_inputan == 1) {
          if ($value->image == "default.jpg" || $value->image == null) {
            if ($value->link) {
              $menus['slideshow'][] = [
                'id_slide' => $value->id,
                'title' => $value->title,
                'image' => "",
                'link' => asset($value->link)
              ];
            } else {
              $menus['slideshow'][] = [
                'id_slide' => $value->id,
                'title' => $value->title,
                'image' => "",
                'link' => ""
              ];
            }
          } else if ($value->image) {
            if ($value->link) {
              $menus['slideshow'][] = [
                'id_slide' => $value->id,
                'title' => $value->title,
                'image' => asset('uploaded/media/' . $value->image),
                'link' => asset($value->link)
              ];
            } else {
              $menus['slideshow'][] = [
                'id_slide' => $value->id,
                'title' => $value->title,
                'image' => asset('uploaded/media/' . $value->image),
                'link' => ""
              ];
            }
          }
        } else {
          $menus['slideshow'][] = [
            'id_slide' => $value->id,
            'title' => $value->title,
            'image' => "",
            'link' => $value->link
          ];
        }
      }




      // 

      // } else if ($value->image && $value->id_inputan == 1) {
      //   if ($value->link) {
      //     $menus['slideshow'][] = [
      //       'id_slide' => $value->id,
      //       'title' => $value->title,
      //       'image' => asset('uploaded/media/' . $value->image),
      //       'link' => asset($value->link)
      //     ];
      //   }else {
      //     $menus['slideshow'][] = [
      //       'id_slide' => $value->id,
      //       'title' => $value->title,
      //       'image' => asset('uploaded/media/' . $value->image),
      //       'link' => ""
      //     ];
      //   }
      // }



      // 

      foreach ($horizontal as $value) {

        if ($value->id_menu > 0) {
          $itemMenu = $value->menu;
          $menu_horizontal = null;
          if ($itemMenu != null) {
            $action = $this->getAction($itemMenu->url, $itemMenu->id, $itemMenu->flag);
            $menu_horizontal = [
              'id_menu' => $itemMenu->id,
              'title_id' => $itemMenu->menu_title,
              'title_en'  => $itemMenu->menu_title_en,
              'id_parent' => $itemMenu->parent,
              'description_id' => $itemMenu->description,
              'description_en' => $itemMenu->description_en,
              'action_type' => $action['type'],
              'id_target' => $action['id'],
            ];
          }
          $menus['menu_horizontal'][] = [
            'id_menu' => $value->id,
            'menu_title_id' => $value->menu_title_id,
            'menu_title_en' => $value->menu_title_en,
            'image' => $value->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $value->image),
            'link'      => "",
            'menu' => $menu_horizontal
          ];
        } else {
          $itemMenu = $value->menu;
          $menu_horizontal = null;
          if ($itemMenu != null) {
            $action = $this->getAction($itemMenu->url, $itemMenu->id, $itemMenu->flag);
            $menu_horizontal = [
              'id_menu' => $itemMenu->id,
              'title_id' => $itemMenu->menu_title,
              'title_en'  => $itemMenu->menu_title_en,
              'id_parent' => $itemMenu->parent,
              'description_id' => $itemMenu->description,
              'description_en' => $itemMenu->description_en,
              'action_type' => $action['type'],
              'id_target' => $action['id'],
            ];
          }
          $menus['menu_horizontal'][] = [
            'id_menu' => $value->id,
            'menu_title_id' => $value->menu_title_id,
            'menu_title_en' => $value->menu_title_en,
            'image' => $value->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $value->image),
            'link'      => $value->url,
            'menu' => $menu_horizontal
          ];
        }
      }

      foreach ($menu as $key => $parent) {
        $action = $this->getAction($parent->url, $parent->id, $parent->flag);

        $slugs = str_replace(' ', '_', strtolower($parent->menu_title));
        $menus['menus'][] = [
          'id_menu' => $parent->id,
          'description_id' => isset($parent->description) == false ? '' : $parent->description,
          'description_en' => isset($parent->description_EN) == false ? '' : $parent->description_EN,
          'title_id' => $parent->menu_title,
          'title_en' => $parent->menu_title_en,
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

  public function getAction($url, $parentID, $flag)
  {
    // $about = Menus::all();
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
      $fecthURL = ($url == '#') ? "" : $url;
      // if ($countSubMenu->count() > 0) {
      //   /* Jika parent memiliki child */
      //   $res = [
      //     'type' => 'menu',
      //     'id' => ''
      //   ];} 
      if (($url == '#' and $flag == 1) and ($countSubMenu->count() > 0)) {
        /* Jika menu menuju external link */
        $res = [
          'type' => 'about',
          'id' => $fecthURL
        ];
      } elseif ($url == '#' and $flag == 2) {
        /* Jika menu menuju external link */
        $res = [
          'type' => 'visitor',
          'id' => $fecthURL
        ];
      } elseif ($url == '#' and $flag == 3) {
        /* Jika menu menuju external link */
        $res = [
          'type' => 'contact',
          'id' => $fecthURL
        ];
      } else {
        if ($fecthURL == '') {
          $res = [
            'type' => 'menu',
            'id' => $fecthURL
          ];
        } else {
          $res = [
            'type' => 'link',
            'id' => $fecthURL
          ];
        }
      }
      return $res;
    }
  }
}
