<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class WareHouse extends Model
{
    protected $table ="warehouse";
    public function Product()
    {
        return $this->belongsTo(Product::class,'wh_product_id');
    }
}
