<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Comments;
use General;
use Response;
use Carbon;

class CommentController extends Controller
{
    public function __construct()
    {
        $this->helper = new General;
        $this->response = new Response;
    }

    public function postComments(Request $r)
    {
        $validator = \Validator::make($r->all(), [
            'id_posts'  => 'required|integer',
            'comment'   => 'required|string',
            'name'      => 'required|string|max:20',
            'email'     => 'required|',
        ], $this->helper->RegisterValidationMessageCustom());

        if ($validator->fails()) {
            $headers = $this->response->HEADERS_REQUIRED('POST');
            $response = $this->response->formatResponseWithPages("Error Validations", $validator->errors(), $this->response->STAT_UNPROCESSABLE_ENTITY());
            return response()->json($response, $this->response->STAT_OK(), $headers);
        }

        $postComment = Comments::create([
            'id_user'   => $r->iduser,
            'id_parent' => $r->idparent,
            'id_posts'  => $r->id_posts,
            'comment'   => $r->comment,
            'name'      => $r->name,
            'email'     => $r->email,
        ]);

        $response = $this->response->formatResponseWithPages("Berhasil Menambah Data", $postComment, $this->response->STAT_OK());
        return response()->json($response, $this->response->STAT_OK());
    }

    public function getComments(Request $r)
    {
        $dataComments = Comments::select('name', 'email', 'comment', 'created_at')->where('id_posts', $r->id_post)->paginate(5);
        /* Paginate  */
        $pagination = $this->paging($dataComments);
        /* Data Posts */
        // dd($dataComments->toArray());
        foreach ($dataComments->items() as $value) {
            $comment[] = [
                'name' => $value->name,
                'email' => $value->email,
                'comment' => $value->comment,
                'time' => Carbon\Carbon::parse($value->created_at)->format('c'),
            ];
        }

        if ($dataComments->isNotEmpty()) {
            $response = $this->response->formatResponseWithPages("OK", $comment, $this->response->STAT_OK(), $pagination);
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("COMMENTS NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
    }

    public function paging($raw)
    {
        $object = new \stdClass;
        $object->total = $raw->total();
        $object->per_page = $raw->perPage();
        $object->current_page = $raw->currentPage();
        $object->last_page = $raw->lastPage();
        $object->from = $raw->firstItem();
        $object->to = $raw->lastItem();
        return $object;
    }
}
