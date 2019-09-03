<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RemoveDescToPagesSlide extends Migration
{
    public function up()
    {
        Schema::table('pages_slide', function ($table) {
            $table->dropColumn('desc');
        });
    }

    public function down()
    {
        Schema::table('pages_slide', function ($table) {
            $table->text('desc');
        });
    }
}
