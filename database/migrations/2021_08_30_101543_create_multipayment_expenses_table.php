<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateMultipaymentExpensesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('multipayment_expenses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_expense');
            $table->unsignedBigInteger('id_header');
            $table->unsignedBigInteger('id_payment');
            $table->unsignedBigInteger('id_user');



            $table->foreign('id_user')->references('id')->on('users');
            $table->foreign('id_payment')->references('id')->on('expense_payments');
            $table->foreign('id_header')->references('id')->on('header_vouchers');
            $table->foreign('id_expense')->references('id')->on('expenses_and_purchases');
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
        Schema::dropIfExists('multipayment_expenses');
    }
}
