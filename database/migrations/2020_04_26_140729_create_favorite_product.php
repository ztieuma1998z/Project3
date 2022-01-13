<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateFavoriteProduct extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('favorite_product', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('fp_product_id')->unsigned()->nullable()->length(10);
            $table->bigInteger('fp_user_id')->unsigned()->nullable()->length(20);
            $table->foreign('fp_product_id')->references('id')->on('products')->onDelete('set null');
            $table->foreign('fp_user_id')->references('id')->on('users')->onDelete('set null');
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
        Schema::dropIfExists('favorite_product');
    }
}
