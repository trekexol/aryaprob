<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateCreditNoteDetailsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('credit_note_details', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_credit_note');
            $table->unsignedBigInteger('id_inventory');

            $table->integer('amount');
            $table->decimal('discount',64,2);
            $table->decimal('price',64,4);
            $table->decimal('rate',64,2);

            $table->boolean('exento');
            $table->boolean('islr');

            $table->string('status',1);

            $table->foreign('id_credit_note')->references('id')->on('credit_notes');
            $table->foreign('id_inventory')->references('id')->on('inventories');
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
        Schema::dropIfExists('credit_note_details');
    }
}
