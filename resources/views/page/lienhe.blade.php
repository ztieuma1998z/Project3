	@extends('master')
	@section('content')
	<div class="inner-header">
		<div class="container">
			 	@if(session('thongbao'))
	    		<div class="alert alert-success">
	    			{{session('thongbao')}}
	    		</div>
	    	@endif
			<div class="pull-left">
				<h6 class="inner-title">Contacts</h6>
			</div>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href={{route('trang-chu')}}>Home</a> / <span>Contacts</span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>
	<div class="container">
		<div class="beta-map">

		<div class="abs-fullwidth beta-map wow flipInX"><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d119278.64234022098!2d106.09066562106877!3d20.89390266560119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135a30555555555%3A0x39a8acd006ab8e69!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBTxrAgUGjhuqFtIEvhu7kgVGh14bqtdCBIxrBuZyBZw6puLCBDxqEgc-G7nyAy!5e0!3m2!1svi!2s!4v1552894282056" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe></div>
		</div>
</div>
	<div class="container">
		<div id="content" class="space-top-none">
			
			<div class="space50">&nbsp;</div>
			<div class="row">
				<div class="col-sm-8">
					<h2>Mẫu liên hệ</h2>
					<div class="space20">&nbsp;</div>
					<p>Mọi thắc mắc hoặc góp ý, quý khách vui lòng liên hệ trực tiếp với bộ phận chăm sóc khách hàng của chúng tôi bằng cách điền đầy đủ thông tin vào form bên dưới</p>
					<div class="space20">&nbsp;</div>
					<form method="post" class="contact-form">	
						  <input type="hidden" name="_token" value="{{csrf_token()}}">
						<div class="form-group form-block">
							<input class="input" input name="name" type="text" placeholder="Họ và tên (required)">
						</div>
						<div class="form-group form-block">
								<input class="input" type="email" name="email" placeholder="expample@gmail.com" required="required" width="20px;">
							</div>
						<div class="form-group form-block">
							<input class="input" input name="phone" type="number" placeholder="Số điện thoại">
						</div>
						<div class="form-group form-block">
							<textarea name="message" cols="70" rows="5" placeholder="Nội dung"></textarea>
						</div>
						<div class="form-group form-block">
							<button type="submit" class="beta-btn primary">Gửi thư <i class="fa fa-chevron-right"></i></button>
						</div>
					</form>
				</div>
				<div class="col-sm-4">
					<h2>Thông tin liên lạc</h2>
					<div class="space20">&nbsp;</div>

					<h6 class="contact-title">Địa chỉ</h6>
					<p>
						79/14 Dương Quảng Hàm, Cầu giấy, Hà Nội
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Business Enquiries</h6>
					<p>
						Doloremque laudantium, totam rem aperiam, <br>
						inventore veritatio beatae. <br>
						<a href="mailto:biz@betadesign.com">biz@betadesign.com</a>
					</p>
					<div class="space20">&nbsp;</div>
					<h6 class="contact-title">Employment</h6>
					<p>
						We’re always looking for talented persons to <br>
						join our team. <br>
						<a href="hr@betadesign.com">hr@betadesign.com</a>
					</p>
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
	@endsection