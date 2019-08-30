@extends('admin.layouts.main')

@section('title', 'Partnership Edit')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Partnership Edit</h1>
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
			<div class="panel-body">
				<form action="{{ route('partnership-update', [ 'id' => $partnership->id ]) }}" method="post" enctype="multipart/form-data">
					{{ csrf_field() }}
					<input type="hidden" name="_method" value="PUT">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Title</label>
								<input type="text" name="title" class="form-control input-lg" placeholder="Partnership title" value="{{ $partnership->title }}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Link Partnership</label>
								<input type="text" name="link" class="form-control input-lg" placeholder="dtc.co.id" value="{{ $partnership->link }}">
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-4 col-sm-6">
							<div class="form-group">
								<label>File Partnership</label>
							<input type="file" name="image" class="form-control" value="{{ $partnership->image }}">
								<img src="{{ asset('uploaded/partner/'.$partnership->image)}}"  class="img-thumbnail" width="80" height="80">
							</div>
							@if ($partnership->image != '')
								<a class="btn btn-danger btn-xs" target="_blank" href="{{ asset('uploaded/partner'.$partnership->image)}}">Donwload {{$partnership->title}}</a>
							@endif
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="col-md-12 text-right">
								<div class="row">
									<div class="col-md-12 text-right">
										<div class="col-md-12 text-right">
											<div class="btn-group dropup">
												<button name="status" value="publish" class="btn btn-primary">Add new Partnership</button>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection