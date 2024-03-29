@extends('admin.layouts.main')

@section('title', 'Menu')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Menus Horizontal</h1>
	</div>

	<div class="wrapper-md">

		@if ( Session::has('success') )
			<div class="alert alert-success" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{{ session('success') }}
			</div>
		@endif

		@if (count($errors) > 0)
			<div class="alert-top alert alert-danger">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				<ul>
					@foreach ($errors->all() as $error)
						<li>{{ $error }}</li>
					@endforeach
				</ul>
			</div>
		@endif

		<div class="row">
			<div class="col-sm-12">
				<h4 class="m-t-none m-b">Menus Horizontal<small>(All of this menu will appear at home page of apps as a shorcut menu)</small></h4>
				<hr>

				<!-- Action -->
				<button class="btn btn-primary btn-addon btn-sm pull-left" data-toggle="modal" data-target="#modal-newID"><i class="fa fa-plus"></i>Add horizontal menu</button>
				<form action="{{ route('menuhorizontal_drag') }}" method="post">
					{{ csrf_field() }}
					<input type="hidden" name="id_menus">
					<input type="hidden" name="type">
					<button class="change btn btn-success btn-addon btn-sm pull-right">Save Changed</button>
				</form>

				<div class="clearfix"></div>

				<div id="nestable2" class="dd" style="margin-top: 17px">
					<ol class="dd-list2" data-parent="menu">
						@foreach ($menus as $menu)
							<li class="dd-item dd3-item" id="{{ $menu->id }}"
								data-status="true"
								data-description="{{$menu->description_id}}"
								data-description_en="{{$menu->description_en}}"
								data-id="{{ $menu->id }}"
								data-title="{{$menu->menu_title_id }}"
								data-title_eng="{{ $menu->menu_title_en }}"
								data-link="{{ $menu->url }}"
								data-id_menu="{{$menu->id_menu}}"
								data-preview="{{ $menu->image=="default.jpg"?asset("uploaded/media/default.jpg"):asset("uploaded/menus/".$menu->image) }}">
								<div class="dd-handle dd3-handle"></div><div class="dd3-content">{{ $menu->menu_title_id }}
									<div class="pull-right sortable-action">
										<a href="#" data-toggle="modal" data-target="#modal-edit-menus2"><i class="glyphicon glyphicon-pencil"></i></a>
										&nbsp;&nbsp;
										<a href="#" data-toggle="modal" data-id="{{ $menu->id }}" data-target="#modal-delete"><i class="glyphicon glyphicon-trash"></i></a>
									</div>
								</div>
							</li>
						@endforeach
					</ol>
				</div>
				<br>
				<br>
			</div>
		</div>
	</div>
@endsection

@section('registerscript')
<script>
	$("input[name=id_menus]").focusout(function(){
							$("#menu_idss").attr("value", 0);							
							var ids = $("#menu-headerss option[value='" + $('#input_headerk').val() + "']").attr("data-id");							
							$("#menu_idss").attr("value", ids);
						});
						
	$("input[name=id_menu]").focusout(function(){
		var id = $("#menu-headers option[value='" + $('#input_header').val() + "']").attr("data-id");
		$("#menu_id").attr("value", id);
	});
</script>
@endsection

@section('modal')
	<div class="modal fade" id="modal-newID" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form id="form_menu_horizhontal" action="{{ route('menuhorizontal_store') }}" method="post" enctype="multipart/form-data">
				{{ csrf_field() }}
				<input type="hidden" name="option" value="{{ Request::segment(3) }}">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">New Menu {{ Request::segment(3) }}</h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
								<label>Title ID</label>
								<input type="text" name="menu_title_id" class="form-control"  placeholder="Title for this menu ENG">
							</div>

						<div class="form-group">
							<label>Title EN</label>
							<input type="text" name="menu_title_en" class="form-control"  placeholder="Title for this menu ENG">
						</div>
						
						<div class="form-group">
							<label>Direct To</label>
								<input type="hidden" id="menu_id" name="id" class="form-control">
								<input type="text" id="input_header" name="id_menu" class="form-control" list="menu-headers" placeholder="This menu link to ..." autocomplete="off">
									<datalist id="menu-headers" class="datalist">
										<option value="">Blank</option>
										@foreach ($menu1 as $value)
										<option value="{{$value->menu_title}}" data-id="{{$value->id}}">{{ $value->url}}</option>
										@endforeach
									</datalist>
						</div>
						<div class="form-group">
							<label>Icon</label>
							<div class="form-group">
								<img class="previewImage_" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
								<input type="file" name="image" class="form-control" accept=".svg, .png">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Save change</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	{{-- edit /////////////////////// --}}
	<div class="modal fade" id="modal-edit-menus2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('menuhorizontal_update') }}" method="POST" enctype="multipart/form-data">
				{{ csrf_field() }}
				<input type="hidden" name="id">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Edit <b>Menu</b></h4>
					</div>
					<div class="modal-body">
						<div class="form-group">
							<label>Title ID</label>
							<input type="text" name="menu_title" class="form-control" placeholder="Title for this menu ID">
						</div>

						<div id='textarea'></div>

						<div class="form-group">
							<label>Title EN</label>
							<input type="text" name="menu_titleEN" class="form-control" placeholder="Title for this menu ENG">
						</div>
						
					
						<div class="form-group">
							<label>Direct To</label>
								<input type="hidden" id="menu_ids" name="id" class="form-control">
								<input type="hidden" id="menu_ids" name="idm" class="form-control">
								<input type="hidden" id="menu_idss"  name="ids" class="form-control">
								<input type="text" id="input_headerk" name="id_menus" value="" class="form-control" list="menu-headerss" placeholder="This menu link to ..." autocomplete="off">
									<datalist id="menu-headerss" class="datalist">
										<option value="">Blank</option>
										@foreach ($menu1 as $value)
										<option value="{{$value->menu_title}}" data-id="{{$value->id}}">{{ $value->url}}</option>
										@endforeach
									</datalist>
						</div>

						<div class="form-group">
							<label>Icon</label>
							<div class="form-group">
								<img class="previewImage_" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
								<input type="file" name="image" class="form-control" accept=".svg, .png">
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Save change</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('menuhorizontal_delete') }}" method="post">
				{{ csrf_field() }}
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete <b></b></h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-danger">Yes</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	@include('admin.images.modals')
@endsection

