<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductAttributeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_attribute', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('pa_product_id')->unsigned()->nullable()->length(10);
            $table->integer('pa_attribute_value_id')->unsigned()->nullable()->length(10);
            $table->foreign('pa_product_id')->references('id')->on('products')->onDelete('set null');
            $table->foreign('pa_attribute_value_id')->references('id')->on('attribute_value')->onDelete('set null');
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
        Schema::dropIfExists('product_attribute');
    }
}
