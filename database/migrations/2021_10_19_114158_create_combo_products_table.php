<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateComboProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('combo_products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_combo'); 
            $table->unsignedBigInteger('id_product'); 

            $table->decimal('amount_per_product',64,2);
            
            $table->foreign('id_product')->references('id')->on('products');
            $table->foreign('id_combo')->references('id')->on('products');
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
        Schema::dropIfExists('combo_products');
    }
}
