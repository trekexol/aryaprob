<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHistorialQuotationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('historial_quotations', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_quotation'); 
            $table->unsignedBigInteger('id_user');
            $table->unsignedBigInteger('id_quotation_product')->nullable(); 
            $table->unsignedBigInteger('id_quotation_payment')->nullable(); 
            $table->string('description');

           
            $table->foreign('id_user')->references('id')->on('users');
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
        Schema::dropIfExists('historial_quotations');
    }
}
