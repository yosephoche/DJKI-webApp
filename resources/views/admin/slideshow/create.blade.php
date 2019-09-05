@extends('admin.layouts.main')

@section('title', 'Slideshow Create')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">New Slideshow</h1>
		<small class="text-muted">With slideshow, users will feel closer to your business.</small>
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
				<form action="{{ route('slideshow_store') }}" method="post" enctype="multipart/form-data">

					{{ csrf_field() }}

				<div class="row">
					<div class="col-md-4">
					<div class="form-group">
						<label><b>Select Inputan</b></label>
						<select class="form-control" name="inputan" id="pilihan">
							<option >Choose...</option>
							<option value="1"><b>Picture</b></option>
							<option value="2"><b>Video</b></option>	
						</select>
					</div>
				</div>
				</div>
					
					<div class="row" id="title" style="display:none">
						<div class="col-md-12">
							<div class="form-group">
								<input type="text" name="title"  class="form-control input-lg" placeholder="Slideshow title" value="{!! old('title') !!}">
							</div>
						</div>
					</div>

					<div class="row imagef">
						{{-- video --}}
						{{-- <div class="col-md-4 col-sm-6" id="video" style="display:none">
							<div class="form-group imaged">
								<label>Featured Video</label>
								<div class="form-group">
									<iframe width="100%" src="" frameborder="1" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
								</div>
							</div>
						</div> --}}
						{{-- image --}}
						<div class="col-md-4 col-sm-6" id="image" style="display:none">
							<div class="form-group imaged">
								<label>Featured image</label>
								<div class="form-group">
									<img id="previewImage_-" data-toggle="modal" data-target="#modal-galleries" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
									<input type="hidden" name="image" value="default.jpg" id="targetValue_-">
									@include('admin.images.modals')
								</div>
							</div>
						</div>

						<div class="col-md-4 col-sm-6">
								{{-- link picture --}}
								<div class="form-group linked" id="link" style="display:none">
									<label>Link</label>
									<input type="text" name="link" list="pages" class="form-control" autocomplete="off">
									<datalist id="pages">
									@foreach ($pages as $item)
									<option value="{{$item->slug}}">{{$item->title}}</option>	
									@endforeach
									</datalist>
								</div>
								{{-- link video --}}
								<div class="form-group linked" id="linkvid" style="display:none">
									<label>Link Video</label>
								<input type="text" name="linkvid" class="form-control" value="https://www.youtube.com/embed/" autocomplete="off">
								</div>

								<div class="form-group" id="category" style="display:none">
									<label>Category</label>
									<select class="form-control" name="category">
										<option value="">Uncategorized</option>
										<option value="Home">Home</option>
										<option value="Tentang Kami">Tentang Kami</option>	
									</select>
								</div>
						</div>
					</div>
					<hr>

					<div class="row">
						<div class="col-md-12 text-right">
							<div class="col-md-12 text-right">
								<button type="submit" class="btn btn-primary">Add new slideshow</button>
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