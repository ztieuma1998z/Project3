@extends('master')
@section('content')
 <!-- Begin Slider With Category Menu Area -->
            <div class="slider-with-banner">
                <div class="container">
                    <div class="row">
                        <!-- Begin Category Menu Area -->
                        <div class="col-lg-3">
                            <!--Category Menu Start-->
                            <div class="category-menu">
                                <div class="category-heading">
                                    <h2 class="categories-toggle"><span>Danh mục</span></h2>
                                </div>
                                <div id="cate-toggle" class="category-menu-list">
                                    <ul>
                                        @foreach($loaisp as $lsp)
                                        <li class="right-menu"><a href="{{route('loaisanpham',$lsp->id)}}">{{$lsp->name}}</a>
                                            <ul class="cat-mega-menu">
                                                @foreach($lsp->category as $ct )
                                                <li class="right-menu cat-mega-title"><a href="{{route('danhmucsp',$ct->id)}}">{{$ct->name}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                        @endforeach
                                        <li class="right-menu" style="background: #fed700"><a href="#">Hãng sản xuất</a>
                                            <ul class="cat-mega-menu">
                                                @foreach($nhacc as $ncc )
                                                <li class="right-menu cat-mega-title"><a href="{{route('danhmucsphang',$ncc->id)}}">{{$ncc->name_supplier}}</a></li>
                                                @endforeach
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <!--Category Menu End-->
                        </div>
                        <!-- Category Menu Area End Here -->
                        <!-- Begin Slider Area -->
                        <div class="col-lg-9">
                            <div class="slider-area pt-sm-30 pt-xs-30">
                                <div class="slider-active owl-carousel">
                                    @foreach($slide as $sl)
                                    <!-- Begin Single Slide Area -->
                                    <div class="single-slide align-center-left animation-style-02 bg-4" style="background-image: url(./{{$sl->image}}); background-size: cover; ">
                                    </div>
                                    <!-- Single Slide Area End Here -->
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Slider Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Slider With Category Menu Area End Here -->
            <!-- Begin Li's Static Banner Area -->
            <div class="li-static-banner pt-20 pt-sm-30 pt-xs-30">
                <div class="container">
                    <div class="row">
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4">
                            <div class="single-banner pb-xs-30">
                                <a href="{{route('trang-chu')}}">
                                    <img src="slide 7.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4">
                            <div class="single-banner pb-xs-30">
                                <a href="{{route('trang-chu')}}">
                                    <img src="slide4.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                        <!-- Begin Single Banner Area -->
                        <div class="col-lg-4 col-md-4">
                            <div class="single-banner">
                                <a href="{{route('trang-chu')}}">
                                    <img src="slide5.jpg" alt="Li's Static Banner">
                                </a>
                            </div>
                        </div>
                        <!-- Single Banner Area End Here -->
                    </div>
                </div>
            </div>
            <!-- Li's Static Banner Area End Here -->
              <section class="product-area li-laptop-product Special-product pt-60 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Sản phẩm mới</span>
                                </h2>
                            </div>
                            <div class="row">
                                <div class="special-product-active owl-carousel">
                                    @foreach($new_product as $new)
                                        <div class="col-lg-12">
                                            <!-- single-product-wrap start -->
                                            <div class="single-product-wrap">
                                                <div class="product-image">
                                                    <a href="{{route('chitietsanpham',$new->id)}}">
                                                        <img src="images/product/{{$new->image}}" alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">NEW</span>
                                                </div>
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <h4><a class="product_name" href="{{route('chitietsanpham',$new->id)}}"><?php echo substr($new['name'],0,25) ?>...</a></h4>
                                                        <div class="price-box">
                                                            @if($new->promotion_price==0)
                                                            <span class="new-price">{{number_format($new->unit_price)}} VND</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($new->promotion_price)}} VND</span>
                                                            <span class="old-price">{{number_format($new->unit_price)}} VND</span>
                                                            
                                                            @endif
                                                        </div>
                                                        <div class="countersection">
                                                            <div class="li-countdown"></div>
                                                        </div>
                                                    </div>
                                                    <div class="add-actions">
                                                        <ul class="add-actions-link">
                                                            <li class="add-cart active"><a href="{{route('themgiohang',$new->id)}}">Thêm giỏ hàng</a></li>
                                                           <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                            <li><a href="{{route('chitietsanpham',$new->id)}}" title="xem chi tiết" class="quick-view-btn"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-wrap end -->
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Begin Li's Special Product Area -->
            <section class="product-area li-laptop-product Special-product pt-60 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Sản phẩm khuyến mãi</span>
                                </h2>
                            </div>
                            <div class="row">
                                <div class="special-product-active owl-carousel">
                                    @foreach($sanpham_khuyenmai as $spkm)
                                        <div class="col-lg-12">
                                            <!-- single-product-wrap start -->
                                            <div class="single-product-wrap">
                                                <div class="product-image">
                                                    <a href="{{route('chitietsanpham',$spkm->id)}}">
                                                        <img src="images/product/{{$spkm->image}}" alt="Li's Product Image">
                                                    </a>
                                                    <span class="sticker">SALE</span>
                                                </div>
                                                <div class="product_desc">
                                                    <div class="product_desc_info">
                                                        <h4><a class="product_name" href="{{route('chitietsanpham',$spkm->id)}}"><?php echo substr($spkm['name'],0,25) ?>...</a></h4>
                                                        <div class="price-box">
                                                            @if($spkm->promotion_price==0)
                                                            <span class="new-price">{{number_format($spkm->unit_price)}} VND</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($spkm->promotion_price)}} VND</span>
                                                            <span class="old-price">{{number_format($spkm->unit_price)}} VND</span>
                                                            
                                                            @endif
                                                        </div>
                                                        <div class="countersection">
                                                            <div class="li-countdown"></div>
                                                        </div>
                                                    </div>
                                                    <div class="add-actions">
                                                        <ul class="add-actions-link">
                                                            <li class="add-cart active"><a href="{{route('themgiohang',$spkm->id)}}">Thêm giỏ hàng</a></li>
                                                           <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                            <li><a href="{{route('chitietsanpham',$spkm->id)}}" title="xem chi tiết" class="quick-view-btn"><i class="fa fa-eye"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-wrap end -->
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's Special Product Area End Here -->
            <!-- Begin Li's Laptops Product | Home V2 Area -->
            <section class="product-area li-laptop-product li-laptop-product-2 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>CPU - Bộ vi xử lý</span>
                                </h2>
                            </div>
                            <div class="li-banner-2 pt-15">
                                <div class="row">
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner">
                                            <a href="{{route('danhmucsp',38)}}">
                                                <img src="slide8.jpg" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner pt-xs-30">
                                            <a href="{{route('danhmucsp',38)}}">
                                                <img src="slide9.png" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                </div>
                            </div>
                            <div class="row">
                                <div class="product-active owl-carousel">
                                    @foreach($cpuvxl as $lt)
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="{{route('chitietsanpham',$lt->id)}}">
                                                    <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                </a>
                                                @if($lt->new==1)
                                                <span class="sticker" style="background: red;">New</span>
                                                @endif
                                                @if($lt->promotion_price > 0)
                                                <span class="sticker">SALE</span>
                                                @endif
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                            <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                    <div class="price-box">
                                                        @if($lt->promotion_price==0)
                                                            <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                            <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                        @endif
                                                    </div>
                                                </div>
                                               <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                       <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                        <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's Laptops Product | Home V2 Area End Here -->
            <!-- Begin Li's TV & Audio Product Area -->
            <section class="product-area li-laptop-product li-tv-audio-product-2 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>Mainboard - Bo mạch chủ</span>
                                </h2>
                            </div>
                            <div class="li-banner-2 pt-15">
                                <div class="row">
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner">
                                            <a href="{{route('danhmucsp',39)}}">
                                                <img src="slide8.jpg" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner pt-xs-30">
                                            <a href="{{route('danhmucsp',39)}}">
                                                <img src="slide9.png" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                </div>
                            </div>
                            <div class="row">
                                 <div class="product-active owl-carousel">
                                    @foreach($mainboard as $lt)
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="{{route('chitietsanpham',$lt->id)}}">
                                                    <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                </a>
                                                @if($lt->new==1)
                                                <span class="sticker" style="background: red;">New</span>
                                                @endif
                                                @if($lt->promotion_price > 0)
                                                <span class="sticker">SALE</span>
                                                @endif
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                             <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                    <div class="price-box">
                                                        @if($lt->promotion_price==0)
                                                            <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                            <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                        @endif
                                                    </div>
                                                </div>
                                               <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                       <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                        <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's TV & Audio Product Area End Here -->
            <!-- Begin Li's TV & Audio Product Area -->
            <section class="product-area li-laptop-product li-tv-audio-product-2 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                        <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>RAM - Bộ nhớ</span>
                                </h2>
                            </div>
                            <div class="li-banner-2 pt-15">
                                <div class="row">
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner">
                                            <a href="{{route('danhmucsp',40)}}">
                                                <img src="slide10.jpg" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner pt-xs-30">
                                            <a href="{{route('danhmucsp',40)}}">
                                                <img src="slide11.jpg" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                </div>
                            </div>
                            <div class="row">
                                 <div class="product-active owl-carousel">
                                    @foreach($ram as $lt)
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="{{route('chitietsanpham',$lt->id)}}">
                                                    <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                </a>
                                                @if($lt->new==1)
                                                <span class="sticker" style="background: red;">New</span>
                                                @endif
                                                @if($lt->promotion_price > 0)
                                                <span class="sticker">SALE</span>
                                                @endif
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                             <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                    <div class="price-box">
                                                        @if($lt->promotion_price==0)
                                                            <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                            <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                        @endif
                                                    </div>
                                                </div>
                                               <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                       <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                        <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's TV & Audio Product Area End Here -->
            <!-- Begin Li's Smart Phone Product Area -->
            <section class="product-area li-laptop-product li-smart-phone-product-2 pb-50">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Section Area -->
                         <div class="col-lg-12">
                            <div class="li-section-title">
                                <h2>
                                    <span>VGA - Card màn hình</span>
                                </h2>
                            </div>
                            <div class="li-banner-2 pt-15">
                                <div class="row">
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner">
                                            <a href="hihi">
                                                <img src="slide8.jpg" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                    <!-- Begin Single Banner Area -->
                                    <div class="col-lg-6 col-md-6">
                                        <div class="single-banner pt-xs-30">
                                            <a href="hihi">
                                                <img src="slide9.png" alt="Li's Static Banner">
                                            </a>
                                        </div>
                                    </div>
                                    <!-- Single Banner Area End Here -->
                                </div>
                            </div>
                            <div class="row">
                                 <div class="product-active owl-carousel">
                                    @foreach($card as $lt)
                                    <div class="col-lg-12">
                                        <!-- single-product-wrap start -->
                                        <div class="single-product-wrap">
                                            <div class="product-image">
                                                <a href="{{route('chitietsanpham',$lt->id)}}">
                                                    <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                </a>
                                                @if($lt->new==1)
                                                <span class="sticker" style="background: red;">New</span>
                                                @endif
                                                @if($lt->promotion_price > 0)
                                                <span class="sticker">SALE</span>
                                                @endif
                                            </div>
                                            <div class="product_desc">
                                                <div class="product_desc_info">
                                                    <div class="product-review">
                                                        <h5 class="manufacturer">
                                                             <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                        </h5>
                                                        <div class="rating-box">
                                                            <ul class="rating">
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                    <div class="price-box">
                                                        @if($lt->promotion_price==0)
                                                            <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                            @else
                                                            <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                            <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                        @endif
                                                    </div>
                                                </div>
                                               <div class="add-actions">
                                                    <ul class="add-actions-link">
                                                        <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                       <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                        <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- single-product-wrap end -->
                                    </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                        <!-- Li's Section Area End Here -->
                    </div>
                </div>
            </section>
            <!-- Li's Smart Phone Product Area End Here -->
            <!-- Begin Li's Static Home Area -->
            <div class="li-static-home">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <!-- Begin Li's Static Home Image Area -->
                            <div class="li-static-home-image" style="background-image: url(slide12.png)"></div>
                            <!-- Li's Static Home Image Area End Here -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- Li's Static Home Area End Here -->
            <!-- Begin Li's Trending Product | Home V2 Area -->
            <section class="product-area li-trending-product li-trending-product-2 pt-60 pb-45">
                <div class="container">
                    <div class="row">
                        <!-- Begin Li's Tab Menu Area -->
                        <div class="col-lg-12">
                            <div class="li-product-tab li-trending-product-tab">
                                <h2>
                                    <span>Sản phẩm khác</span>
                                </h2>
                                <ul class="nav li-product-menu li-trending-product-menu">
                                   <li><a class="active" data-toggle="tab" href="#home1"><span>PSU -Nguồn</span></a></li>
                                   <li><a data-toggle="tab" href="#home2"><span>Case máy tính</span></a></li>
                                   <li><a data-toggle="tab" href="#home3"><span>Tản nhiệt</span></a></li>
                                   <li><a data-toggle="tab" href="#home4"><span>Ổ cứng</span></a></li>
                                </ul>               
                            </div>
                            <!-- Begin Li's Tab Menu Content Area -->
                            <div class="tab-content li-tab-content li-trending-product-content">
                                <div id="home1" class="tab-pane show fade in active">
                                    <div class="row">
                                        <div class="product-active owl-carousel">
                                            @foreach($nguon as $lt)
                                            <div class="col-lg-12">
                                                <!-- single-product-wrap start -->
                                                <div class="single-product-wrap">
                                                    <div class="product-image">
                                                        <a href="{{route('chitietsanpham',$lt->id)}}">
                                                            <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                        </a>
                                                        @if($lt->new==1)
                                                        <span class="sticker" style="background: red;">New</span>
                                                        @endif
                                                        @if($lt->promotion_price > 0)
                                                        <span class="sticker">SALE</span>
                                                        @endif
                                                    </div>
                                                    <div class="product_desc">
                                                        <div class="product_desc_info">
                                                            <div class="product-review">
                                                                <h5 class="manufacturer">
                                                                     <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                                </h5>
                                                                <div class="rating-box">
                                                                    <ul class="rating">
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                            <div class="price-box">
                                                                @if($lt->promotion_price==0)
                                                                    <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                                    @else
                                                                    <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                                    <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                       <div class="add-actions">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                               <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                                <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- single-product-wrap end -->
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div id="home2" class="tab-pane fade">
                                    <div class="row">
                                        <div class="product-active owl-carousel">
                                            @foreach($case as $lt)
                                            <div class="col-lg-12">
                                                <!-- single-product-wrap start -->
                                                <div class="single-product-wrap">
                                                    <div class="product-image">
                                                        <a href="{{route('chitietsanpham',$lt->id)}}">
                                                            <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                        </a>
                                                        @if($lt->new==1)
                                                        <span class="sticker" style="background: red;">New</span>
                                                        @endif
                                                        @if($lt->promotion_price > 0)
                                                        <span class="sticker">SALE</span>
                                                        @endif
                                                    </div>
                                                    <div class="product_desc">
                                                        <div class="product_desc_info">
                                                            <div class="product-review">
                                                                <h5 class="manufacturer">
                                                                     <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                                </h5>
                                                                <div class="rating-box">
                                                                    <ul class="rating">
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                            <div class="price-box">
                                                                @if($lt->promotion_price==0)
                                                                    <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                                    @else
                                                                    <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                                    <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                       <div class="add-actions">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                               <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                                <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- single-product-wrap end -->
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div id="home3" class="tab-pane fade">
                                    <div class="row">
                                        <div class="product-active owl-carousel">
                                           @foreach($tannhiet as $lt)
                                            <div class="col-lg-12">
                                                <!-- single-product-wrap start -->
                                                <div class="single-product-wrap">
                                                    <div class="product-image">
                                                        <a href="{{route('chitietsanpham',$lt->id)}}">
                                                            <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                        </a>
                                                        @if($lt->new==1)
                                                        <span class="sticker" style="background: red;">New</span>
                                                        @endif
                                                        @if($lt->promotion_price > 0)
                                                        <span class="sticker">SALE</span>
                                                        @endif
                                                    </div>
                                                    <div class="product_desc">
                                                        <div class="product_desc_info">
                                                            <div class="product-review">
                                                                <h5 class="manufacturer">
                                                                     <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                                </h5>
                                                                <div class="rating-box">
                                                                    <ul class="rating">
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                            <div class="price-box">
                                                                @if($lt->promotion_price==0)
                                                                    <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                                    @else
                                                                    <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                                    <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                       <div class="add-actions">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                               <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                                <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- single-product-wrap end -->
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                                <div id="home4" class="tab-pane fade">
                                    <div class="row">
                                        <div class="product-active owl-carousel">
                                           @foreach($ocung as $lt)
                                            <div class="col-lg-12">
                                                <!-- single-product-wrap start -->
                                                <div class="single-product-wrap">
                                                    <div class="product-image">
                                                        <a href="{{route('chitietsanpham',$lt->id)}}">
                                                            <img src="images/product/{{$lt->image}}" alt="Li's Product Image">
                                                        </a>
                                                        @if($lt->new==1)
                                                        <span class="sticker" style="background: red;">New</span>
                                                        @endif
                                                        @if($lt->promotion_price > 0)
                                                        <span class="sticker">SALE</span>
                                                        @endif
                                                    </div>
                                                    <div class="product_desc">
                                                        <div class="product_desc_info">
                                                            <div class="product-review">
                                                                <h5 class="manufacturer">
                                                                     <a href="{{route('danhmucsp',$lt->category->id)}}">{{$lt->category->name}}</a>
                                                                </h5>
                                                                <div class="rating-box">
                                                                    <ul class="rating">
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                        <li class="no-star"><i class="fa fa-star-o"></i></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                            <h4><a class="product_name" href="{{route('chitietsanpham',$lt->id)}}"><?php echo substr($lt['name'],0,25) ?>...</a></h4>
                                                            <div class="price-box">
                                                                @if($lt->promotion_price==0)
                                                                    <span class="new-price">{{number_format($lt->unit_price)}} đ</span>
                                                                    @else
                                                                    <span class="new-price new-price-2">{{number_format($lt->promotion_price)}} đ</span>
                                                                    <span class="old-price">{{number_format($lt->unit_price)}} đ</span>
                                                                @endif
                                                            </div>
                                                        </div>
                                                       <div class="add-actions">
                                                            <ul class="add-actions-link">
                                                                <li class="add-cart active"><a href="{{route('themgiohang',$lt->id)}}">Thêm giỏ hàng</a></li>
                                                               <!--  <li><a class="links-details" href="wishlist.html"><i class="fa fa-heart-o"></i></a></li> -->
                                                                <li><a href="{{route('chitietsanpham',$lt->id)}}" title="xem chi tiết"><i class="fa fa-eye"></i></a></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                                <!-- single-product-wrap end -->
                                            </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Tab Menu Content Area End Here -->
                        </div>
                        <!-- Tab Menu Area End Here -->
                    </div>
                </div>
            </section>
         <style type="text/css">
             .right-menu.cat-mega-title{
                width: 50%!important;
             }
         </style>
			
@endsection