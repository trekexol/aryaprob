<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateChargeOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('charge_orders', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('id_client')->nullable();
            $table->unsignedBigInteger('id_provider')->nullable();
            $table->unsignedBigInteger('id_branch')->nullable();
            $table->unsignedBigInteger('id_user')->nullable();

            $table->date('date');
            $table->string('reference',60)->nullable();
            $table->string('description',100)->nullable();

            $table->decimal('amount',64,2);
            $table->decimal('rate',64,2);
            $table->string('coin',20);

            $table->string('status',1);

            $table->foreign('id_client')->references('id')->on('clients');
            $table->foreign('id_provider')->references('id')->on('providers');
            $table->foreign('id_branch')->references('id')->on('branches');
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
        Schema::dropIfExists('charge_orders');
    }
}
