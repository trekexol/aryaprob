<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnticipoQuotationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('anticipo_quotations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_quotation'); 
            $table->unsignedBigInteger('id_anticipo'); 
            
            $table->foreign('id_anticipo')->references('id')->on('anticipos');
            $table->foreign('id_quotation')->references('id')->on('quotations');
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
        Schema::dropIfExists('anticipo_quotations');
    }
}
