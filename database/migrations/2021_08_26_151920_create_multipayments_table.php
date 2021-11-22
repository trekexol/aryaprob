<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMultipaymentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('multipayments', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_quotation');
            $table->unsignedBigInteger('id_header');
            $table->unsignedBigInteger('id_payment');
            $table->unsignedBigInteger('id_user');



            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_payment')->references('id')->on('quotation_payments');
            $table->foreign('id_header')->references('id')->on('header_vouchers');
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
        Schema::dropIfExists('multipayment');
    }
}
