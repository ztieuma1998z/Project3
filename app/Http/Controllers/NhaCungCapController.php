<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Supplier;

class NhaCungCapController extends Controller
{
    // const UPDATED_AT = null;
    //
    public function getDanhSach(){
    	$supplier = Supplier::all();
        $supplier = Supplier::paginate(5);
        return view('admin.nhacungcap.danhsach',['supplier'=>$supplier]);
    }

     public function getEdit($id){
        $supplier = Supplier::find($id);
        return view('admin.nhacungcap.edit',['supplier'=>$supplier]);
    }

    public function postEdit(Request $req,$id){
        $this->validate($req,
            [
                'name_supplier'=>'required',
            ],
            [
                'name_supplier.required'=>'bạn chưa nhập tên hãng sản xuất'
            ]);
        $supplier = Supplier::find($id);
        $supplier->name_supplier = $req->name_supplier;
        $supplier->description = $req->description;
        $supplier->save();
        return redirect('admin/nhacungcap/edit/'.$id)->with('thongbao','Sửa hãng sản xuất thành công!!');
    }

     public function getAdd(){
     	return view('admin.nhacungcap.add');
    }

    public function postAdd(Request $req){
        $this->validate($req,
            [
                'name_supplier'=>'required'
            ],
            [
                'name_supplier.required'=>'bạn chưa nhập tên hãng sản xuất'
            ]);
        $supplier = new Supplier;
        $supplier->name_supplier = $req->name_supplier;
        $supplier->description = $req->description;
        $supplier->save();
        return redirect('admin/nhacungcap/add')->with('thongbao','Thêm hãng sản xuất thành công!!');
    }

    public function getDelete($id){
        $supplier = Supplier::find($id);
        $supplier->delete();

        return redirect('admin/nhacungcap/danhsach')->with('thongbao','Xóa thành công!');
    }
}
