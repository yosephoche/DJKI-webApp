@extends('admin.layouts.main')
@section('title', 'Partnership Create')
@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">New Partnership</h1>
		<small class="text-muted">With Partnership, users will feel closer to your business.</small>
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
		<div class="panel direktori">
			<div class="panel-body">
				<form action="{{ route('partnership-store') }}" method="post" enctype="multipart/form-data">
					{{ csrf_field() }}
					<input type="hidden" name="idgroup" value="{{Request::segment(5)}}">
					<div class="row">
						<div class="col-md-12">
						<div class="form-group">
								<label>Title</label>
								<input type="text" name="title" class="form-control input-lg" placeholder="Partnership title" value="{!! old('title') !!}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
						<div class="form-group">
								<label>Link Partnership</label>
								<input type="text" name="link" class="form-control input-lg" placeholder="dtc.co.id" value="{!! old('link') !!}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<div class="form-group">
								<label>File Partnership</label>
								<input type="file" name="image" class="form-control">
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="col-md-12 text-right">
								<div class="btn-group dropup">
									<button name="status" value="publish" class="btn btn-primary">Add new Partnership</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection