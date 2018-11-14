@extends('admin.layouts.main')

@section('title', 'Directory')

@section('contents')
	<a href="{{ route('archive_group_create') }}" class="new-btn" title="New Directory"><i class="glyphicon glyphicon-pencil"></i></a>

	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Directory</h1>
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

		<form  action="{{route('archive')}}" method="get">
			<div class="form-group">
				<input type="type" class="form-control input-lg" name="key" placeholder="Pencarian">
			</div>
		</form>
		<div class="panel">
			<div class="table-responsive">
				<table class="table table-striped m-b-none">
					<thead>
						<tr>
							<th style="width: auto">Directory Name</th>
							<th style="width: auto">Directory Created</th>
							<th style="width: auto">Last Update</th>
							<th style="width: auto;"></th>
						</tr>
					</thead>
					<tbody>
						@forelse ($archive as $g)
							<tr>
								<td>{{ $g->name }}</td>
								<td>{{ $g->created_at }}</td>
								<td>{{ $g->updated_at }}</td>
								<td>
									<a href="{{ route('item_archive',['id'=>$g->id]) }}" class="btn btn-default btn-xs">Open</a>
									<a href="{{ route('archive_group_edit',['id'=>$g->id]) }}" class="btn btn-default btn-xs">Edit</a>
									<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modal-delete" data-id="{{ $g->id }}">Delete</button>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="6" align="center">No Directory <a href='{{route('archive')}}'>Back</a></td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
		<div class="text-center m-t-lg m-b-lg">
			<ul class="pagination pagination-md">
				{{ $archive->appends(request()->except('page'))->links() }}
			</ul>
		</div>
	</div>
@endsection

@section('modal')
	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('archive_group_delete') }}" method="post">

				{{ csrf_field() }}

				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete Directory</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this group?
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
	<script>
		$('#modal-delete').on('show.bs.modal', function (e) {
			var id = $(e.relatedTarget).data('id');
			$(this).find('input[name="id"]').val(id);
		});
	</script>
@endsection
