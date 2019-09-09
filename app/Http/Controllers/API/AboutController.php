<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Menus;
use App\Partnership;
use App\Slideshow;
use App\Pages;
use General, Response;


class AboutController extends Controller
{

    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    public function getAbout()
    {
        $slide = Slideshow::where('category', 'About')->get();;
        $menus = Menus::where('flag', 1)->first();
        $menu_about = Menus::where('parent', $menus->id)->get();
        $partnership = Partnership::all();
        $about = [
            'slideshow' => [],
            'menus' => [],
            'partnership' => [],
        ];
        foreach ($slide as $key => $value) {
            $about['slideshow'][] = [
                'id_slide' => $value->id,
                'title' => $value->title,
                'image' => asset('uploaded/media/' . $value->image),
                'link' => $value->link
            ];
        }

        foreach ($menu_about as $key => $parent) {
            $action = $this->getAction($parent->url, $parent->id);
            $slugs = str_replace(' ', '_', strtolower($parent->menu_title));
            $about['menus'][] = [
                'id_menu' => $parent->id,
                'description_ID' => isset($parent->description) == false ? '' : $parent->description,
                'description_EN' => isset($parent->description_en) == false ? '' : $parent->description_en,
                'title_ID' => $parent->menu_title,
                'title_EN' => $parent->menu_title_en,
                'action_type' => $action['type'],
                'id_target' => $action['id'],
                'image' => $parent->image == 'default.jpg' ? '' : asset("uploaded/menus/" . $parent->image)
            ];
        }

        foreach ($partnership as $key => $value) {
            $about['partnership'][] = [
                'id' => $value->id,
                'title' => $value->title,
                'image' => asset('uploaded/partner/' . $value->image),
                'link' => $value->link,
            ];
        }

        if ($menus) {
            $response = $this->response->formatResponseWithPages("OK", $about, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("POST NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
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
