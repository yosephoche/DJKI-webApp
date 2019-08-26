@extends('admin.layouts.main')

@section('title', 'Slideshow Edit')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Edit Slideshow</h1>
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
				<form action="{{ route('slideshow_update', [ 'id' => $slideshow->id ]) }}" method="post" enctype="multipart/form-data">

					{{ csrf_field() }}
					<input type="hidden" name="_method" value="PUT">

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<input type="text" name="title" class="form-control input-lg" placeholder="Slideshow title" value="{{ $slideshow->title }}">
							</div>

							<div class="form-group">
								<textarea name="desc" class="form-control" rows="5">
									{{ $slideshow->desc }}
								</textarea>
							</div>
						</div>
					</div>

					<div class="row">
						<div class="col-md-4 col-sm-6">
							<label>Featured image</label>
							<div class="form-group">
								<img id="previewImage_-" data-toggle="modal" data-target="#modal-galleries" src="{{ asset('uploaded/media/'.$slideshow->image) }}" width="100%">
								<input type="hidden" name="image" value="{{$slideshow->image}}" id="targetValue_-">
								@include('admin.images.modals')
							</div>
						</div>

						<div class="col-md-4 col-sm-6">
								<div class="form-group linked">
										<label>Link</label>
								<input type="text" name="link" list="pages" class="form-control" value="{{$slideshow->link}}">
										<datalist id="pages">
												@foreach ($pages as $item)
												<option value="{{$item->slug}}">{{$item->title}}</option>	
												@endforeach
										</datalist>
									</div>
		
								{{-- category --}}
						<div class="form-group linked">
								<label for="">Category</label>
						<input type="text" name="category" class="form-control" value="{{$slideshow->category}}">
								</div>
						</div>

					
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12 text-right">
							<div class="col-md-12 text-right">
								<button type="submit" class="btn btn-primary">Save changed</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
@endsection

@section('modal')
	<div class="modal fade" id="modal-schedule" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Publishing Schedule</h4>
					</div>
					<div class="modal-body">
						Select a date and time in the future for your submissions for publication.

						<div class="form-group">
							<label>Date</label>
							<input type="date" name="publish-date" class="form-control">
						</div>

						<div class="form-group">
							<label>Time</label>
							<input type="time" name="publish-time" class="form-control">
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
						<button type="submit" class="btn btn-primary">Schedule</button>
					</div>
				</div>
			</form>
		</div>
	</div>
@endsection
