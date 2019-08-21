<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Comments extends Model
{
    protected $table = 'comments';
    protected $fillable = ['id_user', 'id_parent', 'id_posts', 'comment', 'name', 'email'];

    use SoftDeletes;
    protected $dates = ['deleted_at'];

    public function post()
    {
        return $this->belongsTo('App\Posts', 'id_posts');
    }
}
