@extends('admin.layouts.main')

@section('title', 'Pages Create')

@section('contents')

	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">New Page</h1>
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

		<div class="panel">
			<form action="{{ route('pages_store') }}" method="post" enctype="multipart/form-data">
				{{ csrf_field() }}
				<input type="hidden" name="id_user" value="{{ Auth::user()->id }}">

				<div class="panel-body">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input type="text" name="title" class="form-control input-lg" placeholder="Page title" value="{!! old('title') !!}">
							</div>

							<div class="form-group">
								<textarea name="content" class="editor">{!! old('content') !!}</textarea>
							</div>
						</div>

					</div>

					<div class="row">
						<div class="col-md-6 col-sm-6">
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
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12 text-right">
							<button type="submit" class="btn btn-primary">Add new page</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
@endsection
