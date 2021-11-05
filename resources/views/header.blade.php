
   <!-- Begin Header Area -->
            <header>
                <!-- Begin Header Top Area -->
                <div class="header-top">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Top Left Area -->
                            <div class="col-lg-3 col-md-4">
                                <div class="header-top-left">
                                    <ul class="phone-wrap">
                                        <li><span>Telephone Enquiry:</span><a href="#">+84392242010</a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Left Area End Here -->
                            <!-- Begin Header Top Right Area -->
                            <div class="col-lg-9 col-md-8">
                                <div class="header-top-right">
                                    <ul class="ht-menu">
                                        <!-- Begin Setting Area -->
                                        <li>
                                            @if(Auth::check())
                                            <div class="ht-setting-trigger"><span>{{Auth::user()->full_name}}</span></div>
                                            <div class="setting ht-setting">
                                                @if(Auth::check())
                                                    @if(Auth::user()->level==1)
                                                    <ul class="ht-setting-list">
                                                        <li><a href="{{route('trangchu')}}">Admin</a></li>
                                                        <li><a href="{{route('logout')}}">Đăng xuất</a></li>
                                                    </ul>
                                                    @else
                                                    <ul class="ht-setting-list">
                                                        <li><a href="{{route('logout')}}">Đăng xuất</a></li>
                                                    </ul>
                                                    @endif
                                                @endif
                                            </div>
                                            @else
                                             <a href="{{route('login')}}" class="text-uppercase" style="font-size: 12px;">Đăng Nhập</a> / <a href="{{route('sigin')}}" class="text-uppercase">Đăng Ký</a>
                                            @endif
                                            
                                        </li>
                                        <!-- Setting Area End Here -->
                                        <!-- Begin Currency Area -->
                                        <li>
                                            <span class="currency-selector-wrapper">Currency :</span>
                                            <div class="ht-currency-trigger"><span>USD $</span></div>
                                            <div class="currency ht-currency">
                                                <ul class="ht-setting-list">
                                                    <li><a href="#">EUR €</a></li>
                                                    <li class="active"><a href="#">USD $</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <!-- Currency Area End Here -->
                                        <!-- Begin Language Area -->
                                        <li>
                                            <span class="language-selector-wrapper">Language :</span>
                                            <div class="ht-language-trigger"><span>English</span></div>
                                            <div class="language ht-language">
                                                <ul class="ht-setting-list">
                                                    <li class="active"><a href="#"><img src="source/assets/images/menu/flag-icon/1.jpg" alt="">English</a></li>
                                                    <li><a href="#"><img src="source/assets/images/menu/flag-icon/2.jpg" alt="">Français</a></li>
                                                </ul>
                                            </div>
                                        </li>
                                        <!-- Language Area End Here -->
                                    </ul>
                                </div>
                            </div>
                            <!-- Header Top Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Top Area End Here -->
                <!-- Begin Header Middle Area -->
                <div class="header-middle pl-sm-0 pr-sm-0 pl-xs-0 pr-xs-0">
                    <div class="container">
                        <div class="row">
                            <!-- Begin Header Logo Area -->
                            <div class="col-lg-3">
                                <div class="logo pb-sm-30 pb-xs-30">
                                    <a href="{{route('trang-chu')}}">
                                        <img src="source/assets/images/menu/logo/1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <!-- Header Logo Area End Here -->
                            <!-- Begin Header Middle Right Area -->
                            <div class="col-lg-9 pl-0 ml-sm-15 ml-xs-15">
                                <!-- Begin Header Middle Searchbox Area -->
                                <form action="{{route('search')}}" method="get" class="hm-searchbox">
                                    <select class="nice-select select-search-category">
                                        <option value="0">Tất cả</option>                                                       
                                        <option value="1">Theo tên</option>                           
                                        <option value="2">Theo giá</option>
                                    </select>
                                    <input type="text" name="key" placeholder="Bạn muốn tìm gì nhỉ :))  ...">
                                    <button class="li-btn" type="submit"><i class="fa fa-search"></i></button>
                                </form>
                                <!-- Header Middle Searchbox Area End Here -->
                                <!-- Begin Header Middle Right Area -->
                                <div class="header-middle-right">
                                    <ul class="hm-menu">
                                        <!-- Begin Header Middle Wishlist Area -->
                                        <!-- <li class="hm-wishlist">
                                            <a href="wishlist.html">
                                                <span class="cart-item-count wishlist-item-count">0</span>
                                                <i class="fa fa-heart-o"></i>
                                            </a>
                                        </li> -->
                                        <!-- Header Middle Wishlist Area End Here -->
                                        <!-- Begin Header Mini Cart Area -->
                                        <li class="hm-minicart">
                                            <div class="hm-minicart-trigger">
                                                <span class="item-icon"></span>
                                                
                                                 @if(Session::has('cart'))
                                                <span class="item-text">{{number_format(Session('cart')->totalPrice)}}
                                                    <span class="cart-item-count">
                                                        @if(Session::has('cart'))
                                                            {{Session('cart')->totalQty}}
                                                        @else 0
                                                        @endif
                                                    </span>
                                                </span>
                                                @endif 
                                            </div>
                                            <span></span>
                                            <div class="minicart">
                                                <ul class="minicart-product-list">
                                                    @if(Session::has('cart'))
                                                    @foreach($product_cart as $product)
                                                    <li>
                                                        <a href="{{route('chitietsanpham',$product['item']['id'])}}" class="minicart-product-image">
                                                            <img src="images/product/{{$product['item']['image']}}" alt="cart products">
                                                        </a>
                                                        <div class="minicart-product-details">
                                                            <h6><a href="{{route('chitietsanpham',$product['item']['id'])}}">{{$product['item']['name']}}</a></h6>
                                                            <span>@if($product['item']['promotion_price']==0)
                                                    {{number_format($product['item']['unit_price'])}}
                                                @else {{number_format($product['item']['promotion_price'])}}@endif x {{$product['qty']}}</span>
                                                        </div>
                                                        <a href="{{route('xoagiohang',$product['item']['id'])}}" class="close">
                                                            <i class="fa fa-close"></i>
                                                        </a>
                                                    </li>
                                                    @endforeach
                                                    @endif
                                                </ul>
                                                @if(Session::has('cart'))
                                                <p class="minicart-total">Tổng tiền: <span>{{number_format(Session('cart')->totalPrice)}} VNĐ</span></p>
                                                <div class="minicart-button">
                                                    <a href="http://localhost/lkdt/public/dat-hang" class="li-button li-button-fullwidth li-button-sm">
                                                        <span>Đặt hàng</span>
                                                    </a>
                                                </div>
                                                @endif
                                            </div>
                                        </li>
                                        <!-- Header Mini Cart Area End Here -->
                                    </ul>
                                </div>
                                <!-- Header Middle Right Area End Here -->
                            </div>
                            <!-- Header Middle Right Area End Here -->
                        </div>
                    </div>
                </div>
                <!-- Header Middle Area End Here -->
                <!-- Begin Header Bottom Area -->
                <div class="header-bottom header-sticky d-none d-lg-block">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- Begin Header Bottom Menu Area -->
                                <style type="text/css">ul.menu-main li a:after{display:none;}</style>
                                <div class="hb-menu hb-menu-2 d-xl-block">
                                    <nav>
                                        <ul class="menu-main">
                                            <li><a href="{{route('trang-chu')}}">Trang chủ</a></li>
                                            <li><a href="{{route('lienhe')}}">Liên hệ</a></li>
                                            <li><a href="{{route('gioithieu')}}">Giới thiệu</a></li>
                                            <li><a href="{{route('tintuc')}}">Tin tức</a></li>
                                            <!-- Begin Header Bottom Menu Information Area -->
                                            <li class="hb-info f-right p-0 d-sm-none d-lg-block">
                                                <span>Tạ quang bửu, Hai bà trưng, Hà Nội</span>
                                            </li>
                                            <!-- Header Bottom Menu Information Area End Here -->
                                        </ul>
                                    </nav>
                                </div>
                                <!-- Header Bottom Menu Area End Here -->
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Header Bottom Area End Here -->
                <!-- Begin Mobile Menu Area -->
                <div class="mobile-menu-area d-lg-none d-xl-none col-12">
                    <div class="container"> 
                        <div class="row">
                            <div class="mobile-menu">
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Mobile Menu Area End Here -->
            </header>
            <!-- Header Area End Here -->