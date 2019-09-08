<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Pages;
use App\Archive;
use App\Posts;
use App\ArchiveGroup;
use Response, General;

class SearchController extends Controller
{
    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    public function getAllSearch(Request $r)
    {
        // $data = array();
        $data = [
            $this->searchArchive($r),
            $this->searchPage($r),
            $this->searchPosts($r),
            $this->searchGroupArchive($r),
            $this->total($r),
        ];
        if ($data) {
            $response = $this->response->formatResponseWithPages("OK", $data, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("SEARCH NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        };
    }

    // pages
    public function searchPage(Request $r)
    {
        $data = $r->search;
        if ($data) {
            $pages = Pages::where('title', 'like', "%" . $data . "%")->orWhere('content', 'like', "%" . $data . "%")->orWhere('slug', 'like', "%" . $data . "%")->get();
            $page = $pages->map(function ($value) {
                $images = json_decode($value->image);
                return [
                    'id' => $value->id,
                    'id_category' => "",
                    'title_id' => $value->title,
                    'title_en' => $value->title_en,
                    'descrition_id' => "",
                    'descrition_en' => "",
                    'type' => "pages",
                    'link' => asset('uploaded/media/' . $images[0]),
                    'published' => $value->updated_at,
                ];
            });
        } else {
            $page = "Data Not Found";
        }

        return $page;
    }

    // archive
    public function searchArchive(Request $r)
    {
        $data = $r->search;
        if ($data) {
            $archive = Archive::where('title', 'like', "%" . $data . "%")->orWhere('title_en', 'like', "%" . $data . "%")->get();
            $data = $archive->map(function ($value) {
                return [
                    'id' => $value->id,
                    'id_category' => "",
                    'title_id' => $value->title,
                    'title_en' => $value->title_en,
                    'descrition_id' => $value->desc,
                    'descrition_en' => $value->file_en,
                    'type' => "",
                    'link' => asset('uploaded/download/' . $value->file),
                    'published' => $value->published,
                ];
            });
        } else {
            $data = "Data Not Found";
        }
        return $data;
    }

    public function searchGroupArchive(Request $r)
    {
        $data = $r->search;
        if ($data) {
            $group = ArchiveGroup::where('name', 'like', "%" . $data . "%")->orWhere('name_en', 'like', "%" . $data . "%")->get();
            $data = $group->map(function ($value) {
                return [
                    'id' => $value->id,
                    'id_category' => "",
                    'title_id' => $value->name,
                    'title_en' => $value->name_en,
                    'descrition_id' => $value->desc,
                    'descrition_en' => $value->desc_en,
                    'type' => "directory",
                    'link' => $value->slug,
                    'published' => $value->updated_at,
                ];
            });
        } else {
            $data = "Data Not Found";
        }
        return $data;
    }

    public function searchPosts(Request $r)
    {
        $data = $r->search;
        if ($data) {
            $posts = Posts::where('title', 'like', "%" . $data . "%")->orWhere('title_en', 'like', "%" . $data . "%")->orWhere('content', 'like', "%" . $data . "%")->get();
            $data = $posts->map(function ($value) {
                $images = json_decode($value->image);
                return [
                    'id' => $value->id,
                    'id_category' => $value->category,
                    'title_id' => $value->title,
                    'title_en' => $value->title_en,
                    'descrition_id' => "",
                    'descrition_en' => "",
                    'type' => "posts",
                    'link' => asset('uploaded/media/' . $images[0]),
                    'published' => $value->published,
                ];
            });
        } else {
            $data = "Data Not Found";
        }
        return $data;
    }

    protected function total(Request $r)
    {
        $archive = $this->searchArchive($r);
        $page = $this->searchPage($r);
        $posts = $this->searchPosts($r);
        $group = $this->searchGroupArchive($r);
        $archive = $archive->count();
        $page = $page->count();
        $posts = $posts->count();
        $group = $group->count();

        $data['total'] = ($archive + $page  + $posts  + $group);

        return $data;
    }
}
