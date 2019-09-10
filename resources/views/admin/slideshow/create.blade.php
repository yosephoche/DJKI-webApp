@extends('admin.layouts.main')

@section('title', 'Slideshow Create')
@section('styles')
<style>

    * {
            box-sizing: border-box
        }

        body {
            font-family: "Raleway", sans-serif !important;
        }

        .container{
            margin-top: 5em;
        }

        .container::before{
            content: none;
        }

        .nav-tabs {
            display: grid;
            grid-template-columns: auto auto;
        }

        .nav-tabs .nav-item .nav-link {
            margin-top: 1em;
            text-align: center;
        }

        .form-group {
            display: grid;
            grid-template-columns: 30% auto;
        }

        .tab-content .tab-pane from .form-group-Img {
            margin-top: 1em;
        }

        .tab-content .tab-pane from .form-group {
            margin-top: 1em;
        }

        .tab-content .tab-pane from .form-group .formInput {
            padding-left: 1em;
        }

        .tab-content .tab-pane from .form-group .formInput #exampleText2 {
            margin-bottom: 1em;
        }

        .tab-content .tab-pane .btn-success {
            margin-left: 62em;
            padding: 8px 30px;
        }

        .tab-content #vidio form .formInput {
            margin-top: 1em;
        }

        .tab-content #vidio form .formInput #exampleText3 {
            margin-bottom: 1em;
        }
    </style>
@endsection
@section('contents')
              
               <div class="wrap">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav>
                        <div class="nav nav-tabs" id="nav-tab" role="tablist">
                            <!-- menu gambar -->
                            <a class="nav-item nav-link active" id="nav-gambar-tab" data-toggle="tab" href="#nav-gambar"
                                role="tab" aria-controls="nav-gambar" aria-selected="true">Gambar</a>

                            <!-- menu Vidio -->
                            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile"
                                role="tab" aria-controls="nav-profile" aria-selected="false">Vidio</a>
                        </div>
                    </nav>

                    <!-- Tabs Content -->
                    <div class="tab-content" id="nav-tabContent">
                        <!-- Content Gambar -->
                        <div class="tab-pane fade show active" id="nav-gambar" role="tabpanel"
                            aria-labelledby="nav-gambar-tab">
                            <!-- Slideshow Title -->
                            <input class="form-control" type="text" placeholder="Slideshow Title" id="slideShow">

                            <div class="wrapImgInput">
                                <div class="col-md-4">
                                    <!-- Wrap Img -->
                                    <div class="wrapImg">
                                        <img src="../assets/img/example.png" width="100%">
                                    </div>
                                </div>

                                <div class="col-md-8">
                                    <!-- Wrap Input -->
                                    <div class="wrapInput">
                                        <!-- Wrap Input Link -->
                                        <div class="wrapInputLink">
                                            <label for="inputLink">Link</label>
                                            <input class="form-control" type="text" placeholder="Default input"
                                                id="inputLink">
                                        </div>

                                        <!-- Wrap Select -->
                                        <div class="wrapSelect">
                                            <label for="Select1">Category</label>
                                            <select class="form-control" id="Select1">
                                                <option>Uncategorized</option>
                                                <option>Picture</option>
                                                <option>Video</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                            </div>

                            <hr class="my-4">
                            <button type="button" class="btn add">Add new slideshow</button>
                        </div>

                        <!-- content Vidio -->
                        <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                            <input class="form-control" type="text" placeholder="Default vidio">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
		{{-- <div class="panel">
			<div class="panel-body">
				<form action="{{ route('slideshow_store') }}" method="post" enctype="multipart/form-data">

					{{ csrf_field() }}

				<div class="row">
					<div class="col-md-4">
					<div class="form-group">
						<label><b>Type</b></label>
						<select class="form-control" name="inputan" id="pilihan">
							<option value="">Choose...</option>
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

						<div class="col-md-5 col-sm-6">
								{{-- link picture --}}
								{{-- <div class="form-group linked" id="link" style="display:none">
									<label>Link</label>
									<input type="text" name="link" list="pages" class="form-control" autocomplete="off">
									<datalist id="pages">
									@foreach ($pages as $item)
									<option value="{{$item->slug}}">{{$item->title}}</option>
									@endforeach
									</datalist>
								</div>
								{{-- link video --}}
								{{-- <div class="form-group linked" id="linkvid" style="display:none">
									<label>Link Youtube</label>
								<input type="text" name="linkvid" class="form-control" placeholder="https://www.youtube.com/watch?v=NePJHg1_qCg" autocomplete="off">
								</div>

								<div class="form-group" id="category" style="display:none">
									<label>Category</label>
									<select class="form-control" name="category">
										<option value="">Uncategorized</option>
										<option value="Home">Home</option>
										<option value="About">About</option>
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
			</div> --}}
		{{-- </div>
	</div> --}}
@endsection

{{-- @section('modal')
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
@endsection --}}

@section('registerscript')
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
@endsection