@extends('admin.layouts.main')

@section('title', 'Setting')

@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Setting</h1>
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

		@if (Session::has('message'))
			<div class="alert-top alert alert-success">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{{ Session::get('message') }}
			</div>
		@endif

		<div class="panel">
			<div class="panel-body">
				<form action="{{ route('setting_update') }}" method="post" enctype="multipart/form-data">
					{{ csrf_field() }}

					<div class="row">
						<div class="col-md-12">
							<div class="form-group">
								<label>Site Title</label>
								<input type="text" name="meta_title" class="form-control input-lg" value="{{ $setting->meta_title }}" required>
							</div>

							<div class="form-group">
								<label>Site Description</label>
								<input type="text" name="meta_description" class="form-control input-lg" value="{{ $setting->meta_description }}" required>
								<i>In a few words, explain what this site is about.</i>
							</div>

							<div class="form-group">
								<label>Keyword for SEO</label><br>
								<input ui-jq="tagsinput" ui-options="" name="meta_keyword" class="form-control input-lg" value="{{ $setting->meta_keyword }}" required/>
							</div>

							<div class="col-md-12 timeMaintenence">
								<div class="col-md-4 col-sm-6 colTimezone">
									<div class="form-group">
										<label>Site Timezone</label>
										<select class="form-control" name="timezone">
											<?php
												$timezone = ['Asia/Jakarta', 'Asia/Makassar', 'Asia/Jayapura'];
												for ($i=0; $i < count($timezone); $i++) {
											?>
											<option value="{{ $timezone[$i] }}" {{ $timezone[$i] == $setting->timezone ? 'selected' : '' }}>{{ $timezone[$i] }}</option>
											<?php
												}
											?>
										</select>
									</div>
								</div>

								<div class="col-md-4 col-sm-6">
									<div class="form-group">
										<label>Maintenance Status</label><br>
										<label class="i-switch m-t-xs m-r">
											<input type="checkbox" name="maintenance" {{ $setting->maintenance == 1 ? 'checked' : '' }}>
											<i></i>
										</label>
									</div>
								</div>
							</div>

							<div class="col-md-4 col-sm-6 colFeaturedImg">
								<div class="form-group">
									<label>Featured image</label>
									@if ($setting->og_image != '')
										<img src="{{ asset('uploaded').'/setting//'.$setting->og_image }}" width="100%">
									@endif
									<input type="file" name="og_image" class="form-control" accept=".jpg, .jpeg, .png">
								</div>
							</div>

							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									<label>Logo (50px * 50px)</label>
									@if ($setting->logo != '')
										<br>
										<img src="{{ asset('uploaded').'/setting//'.$setting->logo }}" width="50px">
										<br>
										<br>
									@endif
									<input type="file" name="logo" class="form-control" accept=".jpg, .jpeg, .png">
								</div>
							</div>

							<div class="col-md-4 col-sm-6">
								<div class="form-group">
									<label>Favicon (16px * 16px)</label>
									@if ($setting->favicon != '')
										<br>
										<img src="{{ asset('uploaded').'/setting//'.$setting->favicon }}" width="16px">
										<br>
										<br>
									@endif
									<input type="file" name="favicon" class="form-control" accept=".jpg, .jpeg, .png">
								</div>
							</div>

						</div>
					</div>

					<div class="row">		

						<div class="col-md-12">
							<hr>
						</div>

						<div class="col-md-12">
							<div class="form-group">
								<label>Running Text</label>
								<input type="text" name="link" class="form-control" id="pinned" list="menu-header" autocomplete="off" placeholder="This menu link to ..." value="{{ $setting->link }}">
								<datalist id="menu-header" class="datalist">
									<option value="#">Blank</option>
									@foreach ($url_posts as $posts)
								<option value="posts/{{ $posts->slug }}">{{ $posts->title }}</option>
									@endforeach
									@foreach ($url_pages as $pages)
										<option value="pages/{{ $pages->slug }}">{{ $pages->title }}</option>
									@endforeach
									@foreach ($url_directory as $directory)
										<option value="directory/{{ $directory->file }}">{{ $directory->title }}</option>
									@endforeach
								</datalist>
							</div>
							<div class="form-group">
								<label>Display Text</label>

								<input type="text" class="form-control" placeholder="Running Text" id="running" name="running_text" value="{{ $setting->running_text }}">
							</div>
							<div class="form-group">
								<label>link</label>
								<?php
								$dataSplitLink = array();
								$splitLink = explode("/", $setting->link); 
								if (count($splitLink) == 2) {
									$dataSplitLink = $splitLink;
								} else {
									$dataSplitLink = array("", $setting->link);
								}
								?>
								<input type="text" id="action_type" hidden name="action_running" value="{{ $dataSplitLink[0] }} "/>
								<input type="text" class="form-control" placeholder="Link" name="alamat" id="linkk" readonly value="{{ $dataSplitLink[1] }}">
							</div>
						</div>
						
					</div>


					<div class="row">
						<div class="col-md-12 colContactMap">
							<hr>
							<h4>Contact</h4>
							@if(isset($setting->address))
							<iframe
							width="100%"
							height="450"
							frameborder="0" style="border:0"
							id="maps"
							src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3UW2dr_crtKOty2Mizn-z3XrcUsVOljI&q={{$setting->address}}" allowfullscreen>
							</iframe>
							@else
							<iframe
							width="1000"
							height="450"
							frameborder="0" style="border:0"
							id="maps"
							src="https://www.google.com/maps/embed/v1/place?key=AIzaSyA3UW2dr_crtKOty2Mizn-z3XrcUsVOljI&q=Indonesia" allowfullscreen>
							</iframe>
							@endif

							<div class="col-md-4 col-sm-6 colEmail" >
								<div class="form-group">
									<label>Email</label>
									<input type="email" name="email" class="form-control" value="{{ $setting->email }}" required>
								</div>
							</div>

							<div class="col-md-4 col-sm-6 colPhone">
								<div class="form-group">
									<label>Phone</label>
									<input type="tel" ui-jq="tagsinput" ui-options="" name="phone" class="form-control" value="{{ $setting->phone }}" required>
								</div>
							</div>

							<div class="col-md-4 col-sm-6 colAddress">
								<div class="form-group">
									<label>Address</label>
									<input type="text" name="address" class="form-control" value="{{ $setting->address }}" id="addr" required>
								</div>
							</div>

							{{-- <div class="col-md-12 sosmed">
								
							</div> --}}
						</div>
					</div>
		
		
					<div class="row col-md-12 wrapSosmed">
						<div class="col-md-12">
							<hr>
							<h4>Link Social Media</h4>
						</div>

						<div class="col-md-6 col-sm-6 wrapFacebook">
							<label>Facebook</label>
							<input type="text" class="form-control" placeholder="www.facebook.com" value="{{ $setting->facebook }}" name="facebook">
						</div>

						<div class="col-md-6 col-sm-6 wrapTwitter">
							<label>Twitter</label>
							<input type="text" class="form-control" placeholder="www.twitter..com" value="{{ $setting->twitter }}" name="twitter">
						</div>

						<div class="col-md-6 col-sm-6 wrapYoutube">
							<label>Youtube</label>
							<input type="text" class="form-control" placeholder="www.youtube.com" value="{{ $setting->youtube }}" name="youtube">
						</div>

						<div class="col-md-6 col-sm-6 wrapInstagram">
							<label>Instagram</label>
							<input type="text" class="form-control" placeholder="www.instagram.com" value="{{ $setting->instagram }}" name="instagram">
						</div>

						{{-- <div class="col-md-6 col-sm-6">
							<label>Google+</label>
							<div class="col-md-12">
								<span class="input-group-addon">https://plus.google.com/</span>
								<input type="text" class="form-control" placeholder="" value="{{ $setting->google }}" name="google">
							</div>
						</div> --}}

						<div class="col-md-6 col-sm-6 wrapLinkedin">
							<label>Linkedin</label>
							<input type="text" class="form-control" placeholder="www.linkedin.com" value="{{ $setting->linkedin }}" name="linkedin">
						</div>
					</div>

							<div class="col-md-12 text-right">
							<button type="submit" class="btn btn-primary">Save Settings</button>
						</div>
						</div>
					</div>
				</form>

				<div class="row">
					<hr>
					<div class="col-lg-2">
						@if ($setting->key_token == null)
							<form action="{{ route('key_token') }}" method="post">
								{{ csrf_field() }}
								<button type="submit" class="btn btn-primary" name="button">Generate API Key</button>
							</form>
							@else
								<button type="submit" class="btn btn-primary" name="button" disabled>Generate API Key</button>
						@endif
					</div>
					<div class="col-lg-8">
						<blockquote>
							Api Key : {{ $setting->key_token==null?'---------------------':$setting->key_token }}
						</blockquote>
					</div>
				</div>

	</div>
@endsection

@section('registerscript')
<script type="text/javascript">
$("#addr").on("change", function () {
	let additional = $(this).val().replace("\\s","+",);
	let baseUrl = "https://www.google.com/maps/embed/v1/place?key=AIzaSyA3UW2dr_crtKOty2Mizn-z3XrcUsVOljI&q="+additional;
	$("#maps").attr("src", baseUrl);
	$('#maps').contentWindow.location.reload(true);
});
</script>
@endsection