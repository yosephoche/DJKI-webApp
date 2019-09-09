<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Posts extends Model
{
    protected $table = 'posts';
    protected $fillable = ['id_user', 'slug', 'title', 'content', 'keyword', 'image', 'category', 'status', 'comment', 'lang'];

    use SoftDeletes;
    protected $dates = ['deleted_at'];

    public function users()
    {
        return $this->belongsTo('App\User', 'id');
    }

    public function comments()
    {
        return $this->hasMany('App\Comments', 'id_posts');
    }

    public function category()
    {
        return $this->belongsTo('App\Category', 'category');
    }

    public function category_id()
    {
        return $this->belongsTo('App\Category', 'category');
    }
}
