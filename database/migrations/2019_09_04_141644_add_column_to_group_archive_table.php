<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddColumnToGroupArchiveTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('group_archive', function (Blueprint $table) {
            $table->string('name_EN');
            $table->string('desc_EN');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('group_archive', function (Blueprint $table) {
            $table->dropColumn('name_EN');
            $table->dropColumn('desc_EN');
        });
    }
}
