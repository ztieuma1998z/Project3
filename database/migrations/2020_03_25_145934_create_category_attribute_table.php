<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCategoryAttributeTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('category_attribute', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('c_a_category_id')->nullable()->unsigned()->length(10);
            $table->integer('c_a_attribute_id')->nullable()->unsigned()->length(10);
            $table->foreign('c_a_category_id')->references('id')->on('categories')->onDelete('set null');
            $table->foreign('c_a_attribute_id')->references('id')->on('attributes')->onDelete('set null');
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
        Schema::dropIfExists('category_attribute');
    }
}
