<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Comments;
use General;
use Response;

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
        $dataComments = Comments::select('name', 'email', 'comment')->where('id_posts', $r->id)->paginate(5);
        if ($dataComments->isNotEmpty()) {
            $response = $this->response->formatResponseWithPages("OK", $dataComments, $this->response->STAT_OK());
            $headers = $this->response->HEADERS_REQUIRED('GET');
            return response()->json($response, $this->response->STAT_OK());
        } else {
            $headers = $this->response->HEADERS_REQUIRED('GET');
            $response = $this->response->formatResponseWithPages("COMMENTS NOT FOUND", [], $this->response->STAT_NOT_FOUND());
            return response()->json($response, $this->response->STAT_NOT_FOUND());
        }
    }
}
