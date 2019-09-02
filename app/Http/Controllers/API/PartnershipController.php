<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Partnership;
use General;
use Response;

class PartnershipController extends Controller
{
    // construk helper
    public function __construct()
    {
        $this->response = new Response;
        $this->helper = new General;
    }
    // get maps
    public function getPartnership()
    {
        // get maps all
        $partner = Partnership::all();

        // maps is not emtpty
        if ($partner->isNotEmpty()) {
            $response = $this->response->formatResponseWithPages("OK", $partner, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("PARTNERSHIP NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
    }
}
