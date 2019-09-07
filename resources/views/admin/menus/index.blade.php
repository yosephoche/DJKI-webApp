@extends('admin.layouts.main')

@section('title', 'Menu')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Menus</h1>
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
				<h4 class="m-t-none m-b">Menus <small>(All of this menu will appear at the top of the page)</small></h4>
				<div class="btn-group" role="group" aria-label="...">
					<a href="{{route('menus',['option'=>'header'])}}" class="btn btn-default">Header</a>
					<a href="{{route('menus',['option'=>'footer'])}}" class="btn btn-default">Footer</a>
				</div>
				<hr>

				<!-- Action -->
				<button class="btn btn-primary btn-addon btn-sm pull-left" data-toggle="modal" data-target="#modal-newID"><i class="fa fa-plus"></i>Add Menu {{Request::segment(3)}}</button>
				<form action="{{ route('menus_drag') }}" method="post">
					{{ csrf_field() }}
					<input type="hidden" name="id_menus">
					<input type="hidden" name="type">
					<button class="change btn btn-success btn-addon btn-sm pull-right">Save Changed</button>
				</form>

				<div class="clearfix"></div>
				<div id="nestable" class="dd" style="margin-top: 17px">
					<ol class="dd-list" data-parent="menu">
						@foreach ($menus as $menu)
							<li class="dd-item dd3-item" id="{{ $menu->id }}"
								data-status="true"
								data-description="{{$menu->description}}"
								data-description_en="{{$menu->description_en}}"
								data-id="{{ $menu->id }}"
								data-title="{{$menu->menu_title }}"
								data-title_eng="{{ $menu->menu_title_en }}"
								data-link="{{ $menu->url }}"
								data-submenu="{{ $menu->parent }}"
								data-preview="{{ $menu->image=="default.jpg"?asset("uploaded/media/default.jpg"):asset("uploaded/menus/".$menu->image) }}">
								<div class="dd-handle dd3-handle"></div><div class="dd3-content">{{ $menu->menu_title }}
									<div class="pull-right sortable-action">
										<a href="#" data-toggle="modal" data-target="#modal-edit-menus"><i class="glyphicon glyphicon-pencil"></i></a>
										&nbsp;&nbsp;
										<a href="#" data-toggle="modal" data-id="{{ $menu->id }}" data-target="#modal-delete"><i class="glyphicon glyphicon-trash"></i></a>
									</div>
								</div>
								<?php $submenus = DB::table('menus')->where('parent', $menu->id)->orderBy('sort')->get(); ?>
								@if (count($submenus) > 0)
									<ol class="dd-list" data-parent="submenu">
										@foreach ($submenus as $submenu)
											<li class="dd-item dd3-item" id="{{ $submenu->id }}"
												data-status="true"
												data-id="{{ $submenu->id }}"
												{{-- data-description="{{$submenu->description}}"
												data-description_en="{{$submenu->description_en}}" --}}
												data-title="{{ $submenu->menu_title }}"
												data-title_eng="{{ $submenu->menu_title_en }}"
												data-link="{{ $submenu->url }}"
												data-submenu="{{ $submenu->parent }}"
												data-preview="{{ $submenu->image=="default.jpg"?asset("uploaded/media/default.jpg"):asset("uploaded/menus/".$submenu->image) }}">
												<div class="dd-handle dd3-handle"></div><div class="dd3-content">{{ $submenu->menu_title }}
													<div class="pull-right sortable-action">
														<a href="#" data-toggle="modal" data-target="#modal-edit-menus"><i class="glyphicon glyphicon-pencil"></i></a>
														&nbsp;&nbsp;
														<a href="#" data-toggle="modal" data-id="{{ $submenu->id }}" data-target="#modal-delete"><i class="glyphicon glyphicon-trash"></i></a>
													</div>
												</div>
												<?php $subsubmenus = DB::table('menus')->where('parent', $submenu->id)->orderBy('sort')->get(); ?>
												@if (count($subsubmenus) > 0)
													<ol class="dd-list" data-parent="subsubmenu">
														@foreach ($subsubmenus as $subsubmenu)
															<li class="dd-item dd3-item" id="{{ $subsubmenu->id }}"
																data-status="true"
																data-id="{{ $subsubmenu->id }}"
																data-title="{{ $subsubmenu->menu_title }}"
																data-link="{{ $subsubmenu->url }}"
																data-subsubmenu="{{ $subsubmenu->parent }}"
																data-preview="{{ $subsubmenu->image=="default.jpg"?asset("uploaded/media/default.jpg"):asset("uploaded/menus/".$subsubmenu->image) }}">
																<div class="dd-handle dd3-handle"></div><div class="dd3-content">{{ $subsubmenu->menu_title }}
																	<div class="pull-right sortable-action">
																		<a href="#" data-toggle="modal" data-target="#modal-edit-menus"><i class="glyphicon glyphicon-pencil"></i></a>
																		&nbsp;&nbsp;
																		<a href="#" data-toggle="modal" data-id="{{ $subsubmenu->id }}" data-target="#modal-delete"><i class="glyphicon glyphicon-trash"></i></a>
																	</div>
																</div>
															</li>
														@endforeach
													</ol>
												@endif
											</li>
										@endforeach
									</ol>
								@endif
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

@section('modal')
	<div class="modal fade" id="modal-newID" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('menus_store') }}" method="post" enctype="multipart/form-data">
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
							<input type="text" name="menu_title" class="form-control" placeholder="Title for this menu ID">
						</div>

						<div class="form-group">
							<label>Title EN</label>
							<input type="text" name="menu_titleEN" class="form-control" placeholder="Title for this menu ENG">
						</div>

						<div class="form-group">
							<label>Link</label>
							<input type="text" name="url" class="form-control" list="menu-header" autocomplete="off" placeholder="This menu link to ..." id="link">
							<datalist id="menu-header" class="datalist">
								<option value="#">Blank</option>
								@foreach ($url_pages as $page)
									<option value="/page/{{ $page->slug }}">{{ $page->title }}</option>
								@endforeach
								@foreach ($category as $cat)
									<option value="/post/category/{{ $cat->slug }}/{{ $cat->id }}">{{ $cat->name }}</option>
								@endforeach
								{{-- @foreach ($posts as $post)
									<option value="/posts/{{ $post->slug }}/{{ $post->id }}">{{ $post->title }}</option>
								@endforeach --}}
								@foreach ($archive as $arc)
									<option value="/directory/{{ $arc->slug }}/{{ $arc->id }}">{{ $arc->name }}</option>
								@endforeach
								{{-- @foreach ($archive_item as $arc_item)
									<option value="{{ asset('uploaded/download/'.$arc_item->file)}}">{{$arc_item->title}}</option>
								@endforeach --}}
							</datalist>
						</div>

						<div class="form-group">
							<label for="">Sub menu from:</label>
							<select class="form-control" name="parent">
								<option value="0">Not a sub menu</option>
								{{-- @foreach ($menus as $key => $value)
									<option value="{{ $value->id }}">{{ $value->menu_title }}</option>
								@endforeach --}}
								@foreach ($listHeader as $value)
									{{-- @foreach ($menu as $key => $value) --}}
										<option value="{{ $value->id }}">{{ $value->menu_title }}</option>
									{{-- @endforeach --}}
								@endforeach
							</select>
						</div>

						<div class="form-group">
							<label>Featured image</label>
							<div class="form-group">
								<img class="previewImage_" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
								<input type="file" name="image" class="form-control" accept=".svg, .png">
							</div>
						</div>

						<div class="radio">
							<label>
								<input type="radio" name="flag" value="0" checked id="none">
								None
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="1" id="about">
								About
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="2" id="visitor">
								visitor
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="3" id="contact">
								contact
							</label>
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

	<div class="modal fade" id="modal-edit-menus" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('menus_update') }}" method="post" enctype="multipart/form-data">
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
						{{-- <select class="form-control" name="lang">
							<option value="ID">Indonesia</option>
							<option value="EN">English</option>
						</select> --}}
						<div id='textareaEN'></div>

						<div class="form-group">
							<label>Link</label>
							<input type="text" name="url" class="form-control" list="menu-header" placeholder="This menu link to ..." autocomplete="off">
							<datalist id="menu-header" class="datalist">
								<option value="#">Blank</option>
								@foreach ($url_pages as $page)
									<option value="/page/{{ $page->slug }}">{{ $page->title }}</option>
								@endforeach
								@foreach ($category as $cat)
									<option value="/post/category/{{ $cat->slug }}/{{ $cat->id }}">{{ $cat->name }}</option>
								@endforeach
								{{-- @foreach ($posts as $post)
									<option value="/posts/{{ $post->slug }}/{{ $post->id }}">{{ $post->title }}</option>
								@endforeach --}}
								@foreach ($archive as $arc)
									<option value="/directory/{{ $arc->slug }}/{{ $arc->id }}">{{ $arc->name }}</option>
								@endforeach
								{{-- @foreach ($archive_item as $arc_item)
									<option value="{{ asset('uploaded/download/'.$arc_item->file)}}">{{$arc_item->title}}</option>
								@endforeach --}}
							</datalist>
						</div>

						<div class="form-group">
							<label for="">Sub menu from:</label>
							<select class="form-control" name="parent">
								<option value="0">Not a sub menu</option>
								@foreach ($listHeader as $value)
									<option value="{{ $value->id }}">{{ $value->menu_title }}</option>
								@endforeach
								{{-- <option value="0">Not a sub menu</option>
								@foreach ($menus as $key => $value)
									<option value="{{ $value->id }}">{{ $value->menu_title }}</option>
								@endforeach
								@foreach ($listUpdate as $menu)
									@foreach ($menu as $key => $value)
										<option value="{{ $value->id }}">{{ $value->menu_title }}</option>
									@endforeach
								@endforeach --}}
							</select>
						</div>

						<div class="form-group">
							<label>Featured image</label>
							<div class="form-group">
								<img class="previewImage_" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
								<input type="file" name="image" class="form-control" accept=".svg, .png">
							</div>
						</div>

						<div class="radio">
							<label>
								<input type="radio" name="flag" value="0" checked>
								None
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="1">
								About
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="2">
								visitor
							</label>
						</div>
						<div class="radio">
							<label>
								<input type="radio" name="flag" value="3">
								contact
							</label>
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
			<form action="{{ route('menus_delete') }}" method="post">
				{{ csrf_field() }}
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete <b></b></h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this menu?
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
