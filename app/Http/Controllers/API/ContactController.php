<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Settings;
use General, Response;
use DB;


class ContactController extends Controller
{
    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    public function getContact()
    {
        $contact = Settings::first();
        $kontak = [
            'address' => $contact->address,
            'telp' => $contact->phone,
            'email' => $contact->email
        ];

        if ($contact) {
            $response = $this->response->formatResponseWithPages("OK", $kontak, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("POST NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
    }
}
