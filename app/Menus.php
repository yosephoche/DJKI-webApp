<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menus extends Model
{
  public $timestamps = false;
  protected $table = 'menus';

  public function shortcutTo()
  {
    return $this->belongsTo('App\MenuHorizontal', 'id_menu', 'id');
  }
}
