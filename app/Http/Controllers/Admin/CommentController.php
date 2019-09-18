<?php

namespace App\Http\Controllers\Admin;

use App\Comments;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class CommentController extends Controller
{
    public function index(Request $r)
    {
        if ($r->has('key')) {
            $key = $r->key;
        } else {
            $key = '';
        }

        $data['comments'] = Comments::with('post')->where('name', 'like', '%' . $key . '%')
            ->orWhere('email', 'like', '%' . $key . '%')->paginate(10);

        return view('admin.comment.index', $data);
    }

    public function delete(Request $r)
    {
        Comments::destroy($r->id);
        /*Success Message*/
        $r->session()->flash('success', 'Comment Successfully Deleted');
        return redirect(route('comments'));
    }
}
