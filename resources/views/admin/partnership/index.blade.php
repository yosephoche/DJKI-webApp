@extends('admin.layouts.main')

@section('title', 'Partnership')

@section('contents')
	<a href="{{ route('partnership-create') }}" class="new-btn" title="New Partnership"><i class="glyphicon glyphicon-pencil"></i></a>

	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Partnership</h1>
	</div>
	<div class="wrapper-md">

		@if ( Session::has('success') )
			<div class="alert alert-success" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{{ session('success') }}
			</div>
		@endif

		<div class="panel">
			<div class="table-responsive">
				<table class="table table-striped m-b-none">
					<thead>
						<tr>
							<th style="width: auto">Tittle</th>
							<th style="width: auto">Link Picture</th>
							<th style="width: auto">Directory Created</th>
							<th style="width: auto">Last Update</th>
							<th style="width: auto">Action</th>
							<th style="width: auto;"></th>
						</tr>
					</thead>
					<tbody>
						@foreach ($partnership as $row)
							<tr>
							<td><a href="{{'https://'.$row->link}}" target="_blank">{{ $row->title }}</a></td>
							<td><img src="{{ asset('uploaded/partner/'.$row->image)}}"  class="img-thumbnail" width="80" height="80"></td>
								<td>{{ GlobalClass::time($row->created_at) }}</td>
								<td>{{ GlobalClass::time($row->updated_at) }}</td>
								<td>
									
								<a href="{{route('partnership-edit',$row->id)}}" class="btn btn-default btn-xs">Edit</a>
									<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modal-delete" data-id="{{$row->id}}">Delete</button>
								</td>
							</tr>
							@endforeach					
					</tbody>
				</table>
			</div>
		</div>
		<div class="text-center m-t-lg m-b-lg">
			<ul class="pagination pagination-md">
			
			</ul>
		</div>
	</div>
@endsection

@section('modal')
	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('partnership-delete') }}" method="post">

				{{ csrf_field() }}

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete Partnership</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this photo?
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
						<button type="submit" class="btn btn-danger">Yes</button>
					</div>
				</div>
			</form>
		</div>
	</div>
@endsection

@section('registerscript')
	{{-- <script>
		$('#modal-delete').on('show.bs.modal', function (e) {
			var id = $(e.relatedTarget).data('id');
			$(this).find('input[name="id"]').val(id);
		});
	</script> --}}
{{-- @endsection --}}
