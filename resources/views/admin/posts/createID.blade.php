@extends('admin.layouts.main')

@section('title', 'Posts Create')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">New Post</h1>
		<small class="text-muted">With posts, users will feel closer to your business.</small>
	</div>
	<div class="wrapper-md">
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
			{{-- <div class="container">
				<ul class="nav nav-tabs">
					<li role="presentation" class="active"><a href="{{ route('posts_createID') }}">Indonesia</a></li>
					<li role="presentation"><a href="{{ route('posts_createEN') }}">English</a></li>
				</ul>
			</div> --}}
			<div class="col-md-12">
				<div class="panel">
					<div class="panel-body">
						<form id='formPost' action="{{ route('posts_store') }}" method="post" enctype="multipart/form-data">
							{{ csrf_field() }}
							<input type="hidden" name="id_user" value="{{ Auth::user()->id }}">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="">INDONESIA :</label>
										<input type="text" name="titleID" class="form-control input-lg" placeholder="Post title ID" value="{!! old('title') !!}">
									</div>

									<div class="form-group">
										<textarea name="contentID" class="editor">
											{!! old('content') !!}
										</textarea>
									</div>

									<div class="form-group">
										<label for="">ENGLISH :</label>
										<input type="text" name="titleEN" class="form-control input-lg" placeholder="Post title EN" value="{!! old('title_EN') !!}">
									</div>

									<div class="form-group">
										<textarea name="contentEN" class="editor">
											{!! old('content_EN') !!}
										</textarea>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label>Featured image</label>
										@php
											$listImages = session('listImages');
										@endphp
										<div class="form-group">
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-galleries">Open Media</button>
											@include('admin.images.modals')
										</div>
										@if ($listImages)
											<div class="boxImg">
												@for ($i=0; $i < count($listImages); $i++)
													<div class="avatar thumb-xs m-r-xs" style="background: url({{url('uploaded/media/',$listImages[$i])}}) center no-repeat; background-size: cover; width: 34px; height: 34px; vertical-align: middle"></div>
												@endfor
											</div>
											@else
											<div class="boxImg"></div>
										@endif
									</div>
								</div>
								<div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label>Category</label>
										<select class="form-control" name="category">
											<option value="0">Uncategorized</option>
											@foreach ($categories as $key => $value)
												<option value="{{$value->id}}">{{$value->name}}</option>
											@endforeach
										</select>
									</div>
								</div>
								{{-- <div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label for="">Comment</label>
										<select class="form-control" name="comment">
											<option value="1">Allow comment for this post</option>
											<option value="0">Dont allow</option>
										</select>
									</div>
								</div> --}}
							</div>

							<hr>

							<div class="row">
								<div class="col-md-12 text-right">
									<button name="status" value="draft" class="btn btn-default">Save to draft</button>
									{{-- &nbsp;
									<a href="#" id="preview" data-toggle="modal" data-target="#modal-preview" class="btn btn-default"><i class="fa fa-desktop"></i> &nbsp;&nbsp;Preview</a>
									&nbsp; --}}
									<div class="btn-group dropup">
										<button name="status" value="publish" class="btn btn-primary">Publish this post</button>
										<button type="button" style="border-left: 1px solid #5a4daa" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<span class="caret"></span>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<ul class="dropdown-menu pull-right">
											<li><a href="#" data-toggle="modal" data-target="#modal-schedule">Schedule Post</a></li>
										</ul>
									</div>
								</div>
							</div>

							{{-- Open Modal --}}

							<div class="modal fade" id="modal-schedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog modal-sm" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">Publishing Schedule</h4>
										</div>
										<div class="modal-body">
											Select a date and time in the future for your submissions for publication.

											<div class="form-group">
												<label>Date</label>
												<input type="date" name="publish_date" value="{!! old('publish_date') !!}" class="form-control">
											</div>

											<div class="form-group">
												<label>Time</label>
												<input type="time" name="publish_time" value="{!! old('publish_time') !!}" class="form-control">
											</div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-default" data-dismiss="modal">Set</button>
										</div>
									</div>
								</div>
							</div>

							{{-- <div class="modal fade" id="modal-preview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width: calc(100% - 50px)">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
											<h4 class="modal-title" id="myModalLabel">
												<a href="#" id="link-device-lg" onclick="changePreview('lg')" class="btn btn-info"><i class="icon-screen-desktop"></i> &nbsp;&nbsp;Desktop</a>
												&nbsp;
												<a href="#" id="link-device-md" onclick="changePreview('md')" class="btn btn-default"><i class="icon-screen-tablet"></i> &nbsp;&nbsp;Tablet</a>
												&nbsp;
												<a href="#" id="link-device-sm" onclick="changePreview('sm')" class="btn btn-default"><i class="icon-screen-smartphone"></i> &nbsp;&nbsp;Mobile</a>
											</h4>
										</div>
										<div class="modal-body" style="padding: 0">
											<p id="123"></p>
											<iframe src="{{route('posts_preview')}}" id='iframePreview' frameborder="0" style="width: 100%; height: calc(100vh - 120px)"></iframe>
										</div>
									</div>
								</div>
							</div> --}}

							{{-- End modals --}}

						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
@endsection
