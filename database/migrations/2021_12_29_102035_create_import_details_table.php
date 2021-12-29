<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateImportDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('import_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_import');
            $table->unsignedBigInteger('id_purchases');

            $table->date('fecha');
            $table->string('status',2);

            $table->foreign('id_import')->references('id')->on('imports');
            $table->foreign('id_purchases')->references('id')->on('expenses_and_purchases');
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('import_details');
    }
}
