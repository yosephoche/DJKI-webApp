<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Slideshow;
use General;
use Response;

class SlideController extends Controller
{

    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    // get data slide

    public function GetSlide(Request $r)
    {

        if ($r->category) {
            $slide = Slideshow::all()->where('category', '=', $r->category);
        } else {
            $slide = Slideshow::all();
        }
        if ($slide) {
            $response = $this->response->formatResponseWithPages("OK", $slide, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("Slide NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
    }
}
