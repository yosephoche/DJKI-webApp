<?php

namespace App\Http\Controllers\API;

use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Pages;
use App\Slideshow;
use TemplateModule;
use DB;
use Carbon;
use GlobalClass;
use Exception;

class PagesController extends MenusController
{
    public function getPages($idPages = null) {
        $menuIfExist = (!empty($_GET['menu'])) ? (int)$_GET['menu'] : 0;
        try {
            $dataPages = Pages::where('id', $idPages);
            if ($dataPages->count() > 0) {
                /* Filter gambar */
                $data = $dataPages->first();
                $images = json_decode($data->image);
                for ($i=0; $i < count($images) ; $i++) {
                    switch ($images[$i]) {
                        case 'default.jpg':
                            $arrImages = [];
                            break;
                        default:
                            $arrImages[] = asset('uploaded/media/'.$images[$i]);
                            break;
                    }
                }
                /* Initial pages combine */
                if ($menuIfExist != 0) {
                    $pages['response'] = [
                        'id'=>$data->id,
                        'title'=>$data->title,
                        'content_uri'=>route('front_pages',['id'=>$data->id,'slug'=>$data->slug]),
                        'data'=> [
                            'slideshow'=>$this->Slideshow(),
                            'banner'=>$this->customizer('direktur'),
                            'menu' => $this->menu($menuIfExist)
                        ],
                        'image'=>$arrImages
                    ];
                } else {
                    $pages['response'] = [
                        'id'=>$data->id,
                        'title'=>$data->title,
                        'content_uri'=>route('front_pages',['id'=>$data->id,'slug'=>$data->slug]),
                        'data'=> [
                            'slideshow' => [],
                            'banner' => $this->customizer(''),
                            'menu' => []
                        ],
                        'image'=>$arrImages
                    ];
                }
                $pages['diagnostic'] = [
                    'code'=>200,
                    'status'=>'ok'
                ];
                return response($pages, 200);
            } else {
                return response([
                    'diagnostic' => [
                        'status'=>'NOT_FOUND',
                        'code'=>404
                    ]
                ], 404);
            }
        } catch (Exception $exceptione) {
            return response([
                'diagnostic' => [
                    'status'=>'NOT_FOUND',
                    'code'=>404
                ]
            ], 404);
        }
    }

    public function customizer($id) {
        if ($id == "") {
            $banner = [
                'content' => "",
                'link' => "",
                'image' => "",
            ];
            return $banner;
        } else {
            try {
                $listBanner = TemplateModule::setupTheme()['setup']->widget->repeater->$id;
                foreach ($listBanner as $key => $value) {
                    $banner = [
                        'content' => $value->text,
                        'link' => $value->link,
                        'image' => asset('uploaded/media/'.$value->image),
                    ];
                }
                return $banner;
            } catch (Exception $exception) {
                $banner = [
                    'content' => "",
                    'link' => "",
                    'image' => "",
                ];
                return $banner;
            }
        }
    }

    public function Slideshow() {
        try {
            $slider = Slideshow::orderBy('sort','DESC');
            $data = array();
            foreach ($slider->get() as $key => $value) {
                $data[] = [
                    'title'=>$value->title,
                    'desc'=>$value->desc,
                    'image'=>asset('uploaded/media/'.$value->image),
                    'link'=>$value->link
                ];
            }
            return $data;
        } catch (Exception $exception) {
            return [];
        }
    }

    public function menu($idMenu) {
        if ($idMenu == 0) {
            return [];
        } else {
            try {
                $menus = array();
                $countSubMenu = nav(['position'=>'header'])->where('parent', $idMenu);
                foreach ($countSubMenu as $key => $parent) {
                    $action = $this->getAction($parent->url, $parent->id); // Extend From MenusController.php
                    $dataMenu = [
                        'id_parent' => $parent->id,
                        'title' => $parent->menu_title,
                        'action_type'=>$action['type'],
                        'id_target'=>$action['id'],
                        'image'=>$parent->image=='default.jpg'?'':asset("uploaded/menus/".$parent->image)
                    ];
                    array_push($menus, $dataMenu);
                }
                return $menus;
            } catch (Exception $exception) {
                return [];
            }
        }
    }

}
