<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGroupArchive extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
      Schema::create('group_archive', function (Blueprint $table) {
        $table->increments('id');
        $table->string('name', 150);
        $table->text('desc');
        $table->text('slug');
        $table->timestamp('created_at')->default(\DB::raw('CURRENT_TIMESTAMP'));
        $table->timestamp('updated_at')->default(\DB::raw('CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP'));
        $table->softDeletes();
      });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
      Schema::drop('group_archive');
    }
}
