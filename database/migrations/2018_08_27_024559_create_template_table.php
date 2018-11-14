<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTemplateTable extends Migration
{
  public function up()
  {
    Schema::create('templates', function (Blueprint $table) {
      $table->increments('id');
      $table->string('path',100);
      $table->text('setup');
      $table->string('status',10);
    });
  }

  public function down()
  {
    Schema::drop('templates');
  }
}
