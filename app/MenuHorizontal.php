<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class MenuHorizontal extends Model
{
    protected $table = 'menu_horizontals';

    // public function menu()
    // {
    //     return $this->hasMany('App\Menus', 'id');
    // }

    public function menu()
    {
        return $this->hasOne('App\Menus', 'id', 'id_menu');
    }
}
