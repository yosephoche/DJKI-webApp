@extends('admin.layouts.main')

@section('title', 'Posts Edit')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Edit Post</h1>
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
					<li role="presentation" class="active"><a href="{{ route('posts_editID', $posts->id) }}">Indonesia</a></li>
					<li role="presentation"><a href="{{ route('posts_editEN', $posts->id) }}">English</a></li>
				</ul>
			</div> --}}
			<div class="col-md-12">
				<div class="panel">
					<div class="panel-body">
						<form action="{{ route('posts_update', ['id' => $posts->id ]) }}" method="post" enctype="multipart/form-data">

							{{ csrf_field() }}
							<input type="hidden" name="_method" value="PUT">
							<input type="hidden" name="id_user" value="{{ $posts->id_user }}">
							<input type="hidden" name="slug" value="{{ $posts->slug }}">
							<input type="hidden" name="bahasa" value="ID">

							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label for="">INDONESIA :</label>
										<input type="text" name="titleID" class="form-control input-lg" placeholder="Post title indonesia" value="{{ $posts->title }}">
									</div>

									<div class="form-group">
										<textarea name="contentID" class="editor">
											{{ $posts->content }}
										</textarea>
									</div>

									<div class="form-group">
										<label for="">ENGLISH :</label>
										<input type="text" name="titleEN" class="form-control input-lg" placeholder="Post title english" value="{{ $posts->title_EN }}">
									</div>

									<div class="form-group">
										<textarea name="contentEN" class="editor">
											{{ $posts->content_EN }}
										</textarea>
									</div>

								</div>
							</div>

							<div class="row">
								<div class="col-md-4 col-sm-6">
									<div class="form-group">
										@php
											$listImages = json_decode($posts->image);
										@endphp
										<label>Featured image</label>
										<div class="form-group">
											<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-galleries">Open Media</button>
											@include('admin.images.modals')
										</div>
										<div class="boxImg">
											@for ($i=0; $i < count($listImages); $i++)
												<div class="avatar thumb-xs m-r-xs" style="background: url({{url('uploaded/media/',$listImages[$i])}}) center no-repeat; background-size: cover; width: 34px; height: 34px; vertical-align: middle"></div>
											@endfor
										</div>
									</div>
								</div>

								<div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label>Category</label>
										<select class="form-control" name="category">
											<option value="0">Uncategorized</option>
											@foreach ($categories as $key => $value)
												@if ($posts->category == $value->id)
													<option selected value="{{$value->id}}">{{$value->name}}</option>
													@else
													<option value="{{$value->id}}">{{$value->name}}</option>
												@endif
											@endforeach
										</select>
									</div>
								</div>

								{{-- <div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label for="">Comment</label>
										<select class="form-control" name="comment">
											<option value="1" {{ $posts->comment == 1 ? "selected":"" }}>Allow comment for this post</option>
											<option value="0" {{ $posts->comment == 0 ? "selected":"" }}>Dont allow</option>
										</select>
									</div>
								</div> --}}
							</div>

							<hr>

							<div class="row">
								<div class="col-md-12 text-right">
									@if ($posts->status == 'draft')
										<a type="button" style="float: left;" class="btn btn-danger" data-toggle="modal" data-target="#modal-delete" data-id="{{ $posts->id }}">Delete This Posts</a>
									@endif
									<button name="status" class="btn btn-default" value="draft">Save to draft</button>
									{{-- &nbsp;
									<a href="#" id="preview" data-toggle="modal" data-target="#modal-preview" class="btn btn-default"><i class="fa fa-desktop"></i> &nbsp;&nbsp;Preview</a>
									&nbsp; --}}
									<div class="btn-group dropup">
										<button name="status" class="btn btn-primary" value="publish">Publish this post</button>
										<button type="button" style="border-left: 1px solid #5a4daa" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<span class="caret"></span>
											<span class="sr-only">Toggle Dropdown</span>
										</button>
										<ul class="dropdown-menu pull-right">
											<li><a href="#" data-toggle="modal" data-target="#modal-schedule">Schedule Post</a></li>
										</ul>
									</div>
								</div>
								<div class="modal fade" id="modal-schedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
									<div class="modal-dialog modal-sm" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
												<h4 class="modal-title" id="myModalLabel">Publishing Schedule</h4>
											</div>
											<div class="modal-body">
												Select a date and time in the future for your submissions for publication.
												@php
												$publish = explode(' ',$posts->published);
												@endphp
												<div class="form-group">
													<label>Date</label>
													<input type="date" name="publish_date" value="{{$publish[0]}}" class="form-control">
												</div>
												<div class="form-group">
													<label>Time</label>
													<input type="time" name="publish_time" value="{{$publish[1]}}" class="form-control">
												</div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-primary" data-dismiss="modal">Set</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
@endsection

@section('modal')

	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('posts_delete') }}" method="post">

				{{ csrf_field() }}
				<input type="hidden" name="id">

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete Post</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this post?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-danger">Yes</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<div class="modal fade" id="modal-preview" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document" style="width: calc(100% - 50px)">
			<form action="">
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
						<iframe src="" frameborder="0" style="width: 100%; height: calc(100vh - 120px)"></iframe>
					</div>
				</div>
			</form>
		</div>
	</div>
@endsection

@section('registerscript')
	<script>
		$('#modal-delete').on('show.bs.modal', function (e) {
			var id = $(e.relatedTarget).data('id');
			$(this).find('input[name="id"]').val(id);
		});
	</script>
	<script>

		localStorage.setItem("image", '');

		function loadFile(event) {
			var image = URL.createObjectURL(event.target.files[0]);
			localStorage.setItem("image", image);
			$('#image-now').attr('src', image);
		};

		$('#preview').click(function(e) {
			if (localStorage.getItem("image") === '') {
				localStorage.setItem("image", $('#image-now').attr('src'));
			}
			var title = $('input[name="title"]').val();
			var category = $('input[name="category"]').val();
			var content = $('.fr-element.fr-view').html();
			var image = localStorage.getItem("image");
			$('iframe').attr('src', '{{ route('posts_preview') }}?title=' + title + '&category=' + category + '&content=' + content + '&image=' + image);
		});

		function changePreview(size) {
			$('.modal-title a').removeClass();
			$('.modal-title a').addClass('btn btn-default');
			if (size === 'lg') {
				$('#link-device-lg').removeClass();
				$('#link-device-lg').addClass('btn btn-info');
				$('#modal-preview .modal-dialog').css({
					'max-width': 'calc(100% - 50px)',
					'width': '100%'
				});
			} else if (size === 'md') {
				$('#link-device-md').removeClass();
				$('#link-device-md').addClass('btn btn-info');
				$('#modal-preview .modal-dialog').css({
					'max-width': '720px',
					'width': '100%'
				});
			} else {
				$('#link-device-sm').removeClass();
				$('#link-device-sm').addClass('btn btn-info');
				$('#modal-preview .modal-dialog').css({
					'max-width': '360px',
					'width': '100%'
				});
			}
		}
	</script>
@endsection
