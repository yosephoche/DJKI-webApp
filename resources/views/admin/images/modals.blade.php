<div class="modal fade" id="modal-galleries" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-body">
				<div class="container-fluid">
					<div class="dropzone dz-clickable" id="uploadImages">
						<div class="dz-message">
							<h3>Drop files here or click to upload.</h3>
							<p>Pilih gambar dengan format PNG, JPG & JPEG - Ukuran Maks 5 Mb</p>
						</div>
					</div>
					<div class="media" id='boxGalleries'>
						<div class="row">
							@forelse ($images as $key => $res)
								@php
									$ext = explode('.',$res->file_name)[1];
								@endphp
								@if ($ext == 'png' || $ext == 'jpg' || $ext == 'jpeg' || $ext == 'JPG')
									@if (Request::segment(2) == 'posts' or Request::segment(2) == 'pages')
										<div class="col-md-3 item">
											@if (isset($listImages))
												@if (false === array_search($res->file_name,$listImages))
													<input type='checkbox' class="checkbox" autocomplete="off" onclick='maxSelected();' id='image{{$key}}' value='{{$res->file_name}}' name='image[]' data-preview="{{ url('uploaded/media/','thumb-'.$res->file_name) }} ">
													<label for='image{{$key}}' class="control-label">
														<img src='{{url('uploaded/media/','thumb-'.$res->file_name)}}'>
													</label>
													@else
													<input type='checkbox' class="checkbox" autocomplete="off" onclick='maxSelected();' id='image{{$key}}' value='{{$res->file_name}}' name='image[]' data-preview="{{ url('uploaded/media/','thumb-'.$res->file_name) }} " checked>
													<label for='image{{$key}}' class="control-label">
														<img src='{{url('uploaded/media/','thumb-'.$res->file_name)}}'>
													</label>
												@endif
												@else
													<input type='checkbox' class="checkbox" autocomplete="off" onclick='maxSelected();' id='image{{$key}}' value='{{$res->file_name}}' name='image[]' data-preview="{{ url('uploaded/media/','thumb-'.$res->file_name) }} ">
													<label for='image{{$key}}' class="control-label">
														<img src='{{url('uploaded/media/','thumb-'.$res->file_name)}}'>
													</label>
											@endif
										</div>
										@else
											<div class="col-md-2 item">
												<button type="button" onclick="selectImg('{{ url('uploaded/media/','thumb-'.$res->file_name) }}','{{$res->file_name}}')" data-value='{{$res->file_name}}' class="selectCustomizer btn btn-success delete">Select</button>
												<a href="{{ url('uploaded/media/','thumb-'.$res->file_name) }}" target="_blank"><div class="media-item" style="background-image: url('{{ url('uploaded/media/','thumb-'.$res->file_name) }}');"></div></a>
											</div>
									@endif
								@endif
							@empty
								<h4 class="text-center">No Images Found.</h4>
							@endforelse
						</div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
@section('registerscript')
	<script type="text/javascript">
	  Dropzone.autoDiscover = false;
	  $('#uploadImages').dropzone({
	    url: "{{ route('images_store') }}",
	    autoProcessQueue: true,
	    method:"post",
	    acceptedFiles:"image/*",
	    paramName:"filename",
	    maxFilesize: 10,
	    dictInvalidFileType:"File type not authorized",
	    sending: function(file, xhr, formData) {
	      formData.append("_token", "{{ csrf_token() }}");
	    },
	    success:function(res) {
				$('#boxGalleries').load(document.URL + '  #boxGalleries');
	      let output = JSON.parse(res.xhr.response);
	    }
	  });

	  $('.closeModal').click(function() {
	    Dropzone.forElement("#uploadImages").removeAllFiles(true);
	  });

	  $('#modal-delete').on('show.bs.modal', function (e) {
	    var id = $(e.relatedTarget).data('id');
	    $(this).find('input[name="id"]').val(id);
	  });
	</script>
@endsection
