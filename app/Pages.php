<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Pages extends Model
{
    protected $table = 'pages';
    protected $fillable = ['id_user', 'slug', 'title', 'content', 'keyword', 'image'];

    use SoftDeletes;
    protected $dates = ['deleted_at'];
}
