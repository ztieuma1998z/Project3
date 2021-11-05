@extends('admin.layout.index')
@section('content')
    <section class="content-header">
      <h1>
        DANH SÁCH
        <small>Sản phẩm </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Level</a></li>
        <li class="active">Here</li>
      </ol>
    </section>
    <br>
			<!-- Main content -->
			<!-- <div class="content-wrapper"> -->
				<section class="content">
      <div class="row">
        <div class="col-xs-12">
        <div class="box">
                  <!-- /.box-header -->
                  <div class="box-body">
                  	
                  		<div class="row">
                  			<div class="col-sm-12">
				<!-- Task manager table -->
				<div class="panel panel-flat" style="width: 100%; border: 1px solid grey;">
					@if(session('thongbao'))
	    		<div class="alert alert-success">
	    			{{session('thongbao')}}
	    		</div>
	    	@endif
					<table class="table table-bordered table-striped">
							<thead>
								<tr>
									<th>STT</th>
									<th>ID</th>
									<th>Tên</th>
									<th>giá gốc</th>
									<th>giá KM</th>
									<th>imge</th>
									<th>Bảo hành</th>
									<th>Edit</th>
									<th>Delete</th>
								</tr>
							</thead>
							<tbody>
								@foreach($product as $pr )
								<tr style="border: 1px">
									<td>{{$loop->iteration}}</td>
									<td>{{$pr->id}}</td>
									<td>{{$pr->name}}</td>
									<td>{{$pr->unit_price}}</td>
									<td>{{$pr->promotion_price}}</td>
									<td><img src="images/product/{{$pr->image}}" width="50px" height="50px;"></td>
									<td>{{$pr->guarantee}}</td>
									<td class="center"><a href="admin/sanpham/edit/{{$pr->id}}"><i class="icon icon-pencil"></i> Edit</a></td>
									<td class="center">
										<form method="post" action="admin/sanpham/huy/{{$pr->id}}" onsubmit="return confirm('bạn có chắc muốn hủy?')">
											{{csrf_field()}}
											<button class="btn btn-primary" type="submit">Xóa</button>
										</form>
									</td>
								</tr>
								@endforeach
							</tbody>
						</table>
					</div>
                  </div>
                </div>
                <div class="row">
                  			<!-- <div class="col-sm-5">
                  				<div class="dataTables_info" id="example1_info" role="status" aria-live="polite">showing 1 to 1 of 1 entries</div>
                  			</div> -->
                  			<div class="col-sm-7">{{$product->links()}}</div>
                  		</div>
				<!-- /task manager table -->

			</div>
			<!-- /main content -->

		</div>
	</div>
</div>
</section>

@endsection