<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\WareHouse;
use Carbon\Carbon;

class AdminWarehouseController extends Controller
{
    public function import()
    {
        $products = Product::all();
        $data = [
            'products' => $products
        ];
        return view('admin.warehouse.import',$data);
    }
    public function importProduct(Request $request,$id)
    {
        $product = Product::find($id);
        if($product->pro_number + $request->product_number < 0)
        {
            $request->session()->flash('import_error', 'Sản phẩm "'.$product->pro_name.' " mã sản phẩm là '.$id.' chỉ còn '.$product->pro_number.' trong kho !');
            return redirect()->route('admin.warehouse.import');
        }
        $product->pro_number = $product->pro_number + $request->product_number;
        $product->save();
        WareHouse::insert(
            [
                'wh_product_id' => $id,
                'wh_number_import' => $request->product_number,
                'time_import' => Carbon::now()
            ]
        );
        $request->session()->flash('import_success', 'Đã thêm '.$request->product_number.' sản phẩm "'.$product->pro_name.' " mã sản phẩm là '.$id.' vào kho !');
        return redirect()->route('admin.warehouse.import');
    }
    public function history()
    {
        $warehouse = WareHouse::all();
        $data = [
            'warehouse' => $warehouse
        ];
        return view('admin.warehouse.history',$data);
    }
    public function iventory()
    {
        $before_month =  Carbon::now()->subMonths(1);
        $product = Product::where('pro_number','>','10')->get();
        $products_iventory =  array();
        foreach($product as $pro)
        {
            if(isset($pro->Warehouse->sortByDesc('time_import')->first()->time_import))
            {
                if($before_month >= $pro->Warehouse->sortByDesc('time_import')->first()->time_import)
                {
                    array_push($products_iventory,$pro);
                }
            }
        }
        $data = [
            'products' => $products_iventory
        ];
        return view('admin.warehouse.iventory',$data);
    }
    public function bestseller()
    {
        $product_best_seller = Product::where('pro_status',1)->orderBy('pro_pay','DESC')->limit(5)->get();
        $data = [
            'product_best_seller' => $product_best_seller
        ];
        return view('admin.warehouse.bestseller',$data);
    }
    public function hotproduct($id)
    {
        $product = Product::find($id);
        $product->pro_hot = ( $product->pro_hot==1)?0:1;
        $product->save();
        return redirect()->back();
    }
}
