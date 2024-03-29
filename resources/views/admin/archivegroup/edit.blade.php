@extends('admin.layouts.main')
@section('title', 'Gallery Create')
@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Edit Directory Group</h1>
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
				<form action="{{ route('archive_group_update',['id'=>$archive->id]) }}" method="post" enctype="multipart/form-data">
					{{ csrf_field() }}
					<input type="hidden" name="_method" value="PUT">
					<input type="hidden" name="id" value="{{ $archive->id }}">
					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label for="">Title ID</label>
								<input type="text" name="name" class="form-control input-lg" value="{{ $archive->name }}" placeholder="Album Name">
							</div>
							<div class="form-group">
								<label>Description ID</label>
								<textarea name="desc" class="editor">{{ $archive->desc }}</textarea>
							</div>

							<div class="form-group">
								<label for="">Title EN</label>
								<input type="text" name="nameEN" class="form-control input-lg" placeholder="Directory Name" value="{{ $archive->name_en }}">
							</div>
							<div class="form-group">
								<label>Description EN</label>
								<textarea name="descEN" class="editor">{{ $archive->desc_en }}</textarea>
							</div>
						</div>
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12 text-right">
							<div class="col-md-12 text-right">
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection
