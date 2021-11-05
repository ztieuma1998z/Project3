<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Bill;
use App\BillDetail;
use App\Product;
use App\Customer;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
class BillController extends Controller
{
    // const UPDATED_AT = null;
    //
    public function getDanhSach(){
        $customer = Customer::all();
    	$bill = Bill::where('status','đang xử lý')->paginate(10);
        return view('admin.hoadon_ban.dangxuly',['bill'=>$bill,'customer'=>$customer]);
    }

    public function getChitiet(Request $id){
        $bill = Bill::where('id',$id->id)->first();
        $bill_detail = BillDetail::where('id_bill',$bill->id)->get();
        return view('admin.hoadon_ban.chitietdon',compact('bill','bill_detail'));
       
    }

    public function getBan(Request $id){
       $customer = Customer::all();
        $bill = Bill::where('status','đã xử lý')->paginate(10);
        $bill_detail = null;
        return view('admin.hoadon_ban.giao_hang_xong',compact( 'bill','bill_detail'));
    }

    public function postBan(Request $id){
        $bill = Bill::find($id);
        $bill = Bill::where('id',$id->id)->first();
        $bill->status = 'đã xử lý';
        $bill->save();
        return redirect()->back()->with('thongbao','Đã giao hàng!');
    }

      public function getHuy(Request $id){
        $customer = Customer::all();
        $bill = Bill::where('status','đã hủy')->paginate(10);
        $bill_detail = null;
        return view('admin.hoadon_ban.donhang_huy',compact('bill','bill_detail'));
    }

    public function postHuy(Request $id){
        $bill = Bill::find($id);
        $bill = Bill::where('id',$id->id)->first();
        $bill->status = 'đã hủy';
        $bill->save();
        return redirect()->back()->with('thongbao','Đã hủy hàng!');
    }

    public function getSearch(Request $req){
        // $customer = Customer::all();
        $bill = DB::table('customer')->join('bills','customer.id','=','bills.id_customer')->where('customer.name','like','%'.$req->key.'%')
                            // ->orWhere('bills.id',$req->key)
                            ->paginate(12);
        return view('admin.hoadon_ban.search',compact('bill'));
    }
}
