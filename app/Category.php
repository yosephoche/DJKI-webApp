<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    public $timestamps = false;
    protected $table = 'posts_category';

    public function posts()
    {
        return $this->hasMany('App\Posts', 'category');
    }
}
