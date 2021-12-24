<?php

namespace App\Http\Controllers;
use App\Slide;
use App\Product;
use App\ProductType;
use App\Cart;
use App\Customer;
use App\Bill;
use App\BillDetail;
use App\User;
use App\Category;
use App\News;
use App\Comment;
use App\Supplier;
use App\Lienhe;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public  function getIndex(){
    	$slide = Slide::all();
        $loaisp = ProductType::all();
        $danhmuc = Category::all();
        $nhacc  = Supplier::all();
        //--
        $cpuvxl = product::Where('id_type',27)->Where('status','')->paginate(10);
        $mainboard = Product::Where('id_type',28)->Where('status','')->paginate(10);
        $ram = Product::Where('id_type',29)->Where('status','')->paginate(10);
        $card = Product::Where('id_type',30)->Where('status','')->paginate(10);
        $nguon = Product::Where('id_type',31)->Where('status','')->paginate(10);
        $case = Product::Where('id_type',32)->Where('status','')->paginate(10);
        $tannhiet = Product::Where('id_type',33)->Where('status','')->paginate(10);
        $ocung = Product::Where('id_type',34)->Where('status','')->paginate(10);
        $odia = Product::Where('id_type',35)->Where('status','')->paginate(10);
    	$new_product = Product::where('new',1)->Where('status','')->paginate(12);
        // dd($new_product);
    	$sanpham_khuyenmai = Product::where('promotion_price','<>',0)->Where('status','')->paginate(8);
    	return view('page.trangchu',compact('slide','new_product','sanpham_khuyenmai','loaisp','danhmuc','cpuvxl','mainboard','ram','card','nguon','case','tannhiet','ocung','odia','nhacc'));
    }

    public function getLoaiSp($type){
    	$sp_loai = Product::where('id_type',$type)->paginate(16);
        $sp_khac = Product::where('id_type','<>',$type)->paginate(8);
        $loai = ProductType::all();
        $loai_sp = ProductType::where('id',$type)->first();
    	return view('page.loai_sanpham',compact('sp_loai','sp_khac','loai','loai_sp'));
    }

    public function getDanhmucSp($type){
        $sp_loai = Product::where('id_category',$type)->paginate(12);
        $sp_khac = Product::where('id_type','<>',$type)->paginate(8);
        $danhmuc = Category::all();
        $loai_sp = Category::where('id',$type)->first();
        return view('page.danhmucsp',compact('sp_loai','sp_khac','danhmuc','loai_sp'));
    }

     public function getDanhmucSpHang($type){
        $sp_loai = Product::where('id_supplier',$type)->paginate(12);
        $sp_khac = Product::where('id_supplier','<>',$type)->paginate(8);
        $hang_sp = Supplier::where('id',$type)->first();
        return view('page.danhmucsphang',compact('sp_loai','sp_khac','hang_sp'));
    }

    public function getSpNew(){
        $sp_new = Product::where('new',1)->paginate(6);
        $sp_khac = Product::where('new',0)->paginate(8);
        return view('page.sp_new',compact('sp_new','sp_khac'));
    }

    public function getSpSale(){
        $sp_sale = Product::where('promotion_price','<>',0)->paginate(6);
        $sp_khac = Product::where('new',1)->paginate(6);
        return view('page.sp_sale',compact('sp_sale','sp_khac'));
    }

    public function getChitiet(Request $req){
        $sanpham = Product::where('id',$req->id)->first();
        $comment = Comment::where('id_product',$sanpham->id)->get();
        $sp_tuongtu = Product::where('id_type',$sanpham->id_type)->paginate(6);
    	return view('page.chitiet_sanpham',compact('sanpham','sp_tuongtu','comment'));
    }

    public function postComment(Request $req, $id){
        $comment = new Comment;
        $comment->name = $req->author;
        $comment->content = $req->comment;
        $comment->email = $req->email;
        // $comment->id_user = $id;
        $comment->id_product = $id;
        $comment->save();
        return back();
    }
    public function getNews(){
        $tintuc = News::all();
        return view('page.news',compact('tintuc'));
    }

    public function getChitietNews(Request $req,$id)
    {
        $tintuc = News::where('id',$req->id)->first();
        $tintuc_khac = News::where('id','<>',$id)->paginate(8);
        return view('page.news_detail',compact('tintuc','tintuc_khac'));
    }

    public function getLienHe(){
    	return view('page.lienhe');
    }

    public function postLienHe(Request $req){
        $lienhe = new Lienhe();
        $lienhe->name = $req->name;
        $lienhe->email = $req->email;
        $lienhe->phone = $req->phone;
        $lienhe->message = $req->message;
        $lienhe->save();
        return back()->with('thongbao','Gửi liên hệ thành công!');;
    }

    public function getGioiThieu(){
    	return view('page.gioithieu');
    }

    public function getAddtoCart( Request $req,$id){
        $product = Product::find($id);
        $oldCart = Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->add($product,$id);
        $req->session()->put('cart',$cart);
        return redirect()->back();
    }

    public function getDelItemCart($id){
        $oldCart = Session::has('cart')?Session::get('cart'):null;
        $cart = new Cart($oldCart);
        $cart->removeItem($id);
        if(count($cart->items)>0){
            Session::put('cart',$cart);
        }
        else{
            Session::forget('cart');
        }
        return redirect()->back();
    }
    public function getCheckout(){
        return view('page.dat_hang');
    }

    public function postCheckout(Request $req){
        $cart = Session::get('cart');
        $customer = new Customer;
        $customer->name = $req->name;
        $customer->gender = $req->gender;
        $customer->email = $req->email;
        $customer->address = $req->address;
        $customer->phone_number = $req->phone;
        $customer->note = $req->notes;
        $customer->save();

        $bill = new Bill;
        $bill->id_customer = $customer->id;
        $bill->date_order = date('Y-m-d');
        $bill->total = $cart->totalPrice;
        $bill->payment = $req->payment_method;
        $bill->note = $req->notes;
        $bill->status = 'Đang xử lý';
        $bill->save();

        foreach ($cart->items as $key => $value) {
            $bill_detail = new BillDetail;
            $bill_detail->id_bill = $bill->id;
            $bill_detail->id_product = $key;
            $bill_detail->quantity = $value['qty'];
            $bill_detail->unit_price = ($value['price']/$value['qty']);
            $bill_detail->save();
        }
        Session::forget('cart');
        return redirect()->back()->with('thongbao','Đặt Hàng Thành Công!!');
    }

    public function getLogin(){
        return view('page.dangnhap');
    }

    public function getSigin(){
        return view('page.dangky');
    }

    public function postSigin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email|unique:users,email',
                'password'=>'required|min:6|max:20',
                'fullname'=>'required',
                're_password'=>'required|same:password'
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'email.email'=>'email không đúng định dạng',
                'email.unique'=>'email đã được sử dụng',
                'password.required'=>'Vui lòng nhập mật khẩu',
                're_password.same'=>'mật khẩu nhập lại không trùng',
                'password.min'=>'mật khẩu ít nhất 6 ký tự'
            ]);
        $user = new User();
        $user->full_name = $req->fullname;
        $user->email = $req->email;
        $user->password = Hash::make($req->password);
        $user->phone = $req->phone;
        $user->address = $req->address;
        // $user->level = $req->level;
        $user->save();
        return redirect()->back()->with('thanhcong','Đăng ký tài khoản thành công!!');
    }

    public function postLogin(Request $req){
        $this->validate($req,
            [
                'email'=>'required|email',
                'password'=>'required|min:6|max:20'
            ],
            [
                'email.required'=>'Vui lòng nhập email',
                'email.email'=>'Email không đúng định dạng',
                'password.required'=>'Vui lòng nhập mật khẩu',
                'password.min'=>'Mật khẩu ít nhất 6 ký tự',
                'password.max'=>'mật khẩu tối đa 20 ký tự'
            ]
        );
        $credentials = array('email'=>$req->email,'password'=>$req->password);
        if(Auth::attempt($credentials)){
            if (Auth::user()->level==1) {
                return redirect('http://localhost/lkdt/public/index');
            }
            else
            return redirect('index');
        }else{
            return redirect()->back()->with(['flag'=>'danger','message'=>'Tài Khoản Hoặc Mật Khẩu Không Đúng!!']);
        }
    }

    public function postLogout(){
        Auth::logout();
        return redirect()->route('trang-chu');
    }

    public function getSearch(Request $req){
        $product = Product::where('name','like','%'.$req->key.'%')
                            ->orWhere('unit_price',$req->key)
                            ->paginate(12);
        return view('page.search',compact('product'));
    }
}