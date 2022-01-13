<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateTransactionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('transactions', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('tr_user_id')->unsigned()->nullable()->length(20);
            $table->integer('tr_total')->default(0);
            $table->string('tr_note')->nullable();
            $table->string('tr_address')->nullable();
            $table->string('tr_phone')->nullable();
            $table->tinyInteger('tr_status')->default(0);  
            $table->timestamps();
            $table->foreign('tr_user_id')->references('id')->on('users')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('transactions');
    }
}
