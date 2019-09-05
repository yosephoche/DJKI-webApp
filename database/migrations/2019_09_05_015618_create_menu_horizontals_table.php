<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateMenuHorizontalsTable extends Migration
{

    public function up()
    {
        Schema::create('menu_horizontals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('menu_title_id');
            $table->string('menu_title_en');
            $table->longText('description_id');
            $table->longText('description_en');
            $table->string('parent')->nullable();
            $table->text('url');
            $table->enum('status', ['header', 'footer']);
            $table->string('image');
            $table->integer('sort')->default(999);
            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('menu_horizontals');
    }
}
