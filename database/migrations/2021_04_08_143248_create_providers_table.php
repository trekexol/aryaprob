<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProvidersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('providers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('code_provider',20);
            $table->string('razon_social',80);
            $table->string('direction',100);
            $table->string('city',40);
            $table->string('country',30);
            $table->string('phone1',20);
            $table->string('phone2',20);
            $table->boolean('has_credit');
            $table->integer('days_credit');
            $table->double('amount_max_credit', 64, 2);
            $table->double('porc_retencion_iva', 5, 2);
            $table->double('porc_retencion_islr', 5, 2);
            $table->double('balance', 64, 2);
           // $table->integer('select_balance');??
            $table->string('status',1);
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
        Schema::dropIfExists('providers');
    }
}
