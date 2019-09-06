<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Tracker;
use General;
use Response;
use Carbon\Carbon;

class VisitorController extends Controller
{
    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    public function getAllVisitor()
    {
        $data = array();
        $data[] = [
            'weeks' => $this->getAllWeek(),
            'month' => $this->getAllMonth(),
            'year' => $this->getAllYear(),
        ];

        if ($data) {
            $response = $this->response->formatResponseWithPages("OK", $data, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("Maps NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        };
    }
    public function getAllWeek()
    {
        $star = Carbon::now()->startOfWeek();
        $end = Carbon::now()->endOfWeek();
        $minggu = Tracker::whereBetween('created_at', [$star, $end])->get();
        $minggu = count($minggu);

        return $minggu;
    }
    public function getAllMonth()
    {
        $month = Carbon::now();
        $bulan = Tracker::whereMonth('date', '=', $month->month)->get();
        $bulan = count($bulan);
        return $bulan;
    }
    public function getAllYear()
    {
        $year = Carbon::now();
        $tahun = Tracker::whereYear('date', '=', $year->year)->get();
        $tahun = count($tahun);
        return $tahun;
    }
}
