<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Maps;
use General;
use Response;

class MapsController extends Controller
{
    // construk helper
    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }
    // get maps
    public function getMaps(){
        // get maps all
        $maps = Maps::all();

        // maps is not emtpty
        if ($maps->isNotEmpty()) {
            $response = $this->response->formatResponseWithPages("OK", $maps, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("Maps NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }

    }
}
