@extends('admin.layouts.main')

@section('title', 'Comment')

@section('contents')
	{{-- <a href="{{ route('posts_create') }}" class="new-btn" title="New Posts"><i class="glyphicon glyphicon-pencil"></i></a> --}}

	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Comment</h1>
		<small class="text-muted">With posts, users will feel closer to your business.</small>
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

		{{-- @if (Session::has('failed'))
			<div class="alert alert-danger" role="alert">
				<button type="button" class="close" data-dismiss="alert">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{{ session('failed') }}
			</div>
		@endif --}}

		<form  action="{{route('comments')}}" method="get">
			<div class="form-group">
				<input type="type" class="form-control input-lg" name="key" placeholder="Pencarian User">
			</div>
		</form>

		<div class="panel">
			<div class="table-responsive">
				<table class="table table-striped m-b-none">
					<thead>
						<tr>
							<th style="width: auto">Title</th>
							<th style="width: auto">User</th>
							<th style="width: auto">Comment</th>
							<th style="width: auto"></th>
						</tr>
					</thead>
					<tbody>
						@forelse ($comments as $c)
							<tr>
								<td>
									<a href="{{ route('posts_detail', $c->post->slug) }}">{{ $c->post->title }}</a>
								</td>
								<td>{{ $c->email }}</td>
								<td>{{ $c->comment }}</td>
								<td>
									<button class="btn btn-danger btn-xs" data-toggle="modal" data-target="#modal-delete" data-id="{{ $c->id }}">Delete</button>
								</td>
							</tr>
						@empty
							<tr>
								<td colspan="6" align="center">No Comments</td>
							</tr>
						@endforelse
					</tbody>
				</table>
			</div>
		</div>
		<div class="text-center m-t-lg m-b-lg">
			<ul class="pagination pagination-md">
				{{ $comments->links() }}
			</ul>
		</div>
	</div>
@endsection

@section('modal')
	<div class="modal fade" id="modal-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-sm" role="document">
			<form action="{{ route('comments_delete') }}" method="post">
				{{ csrf_field() }}
				<input type="hidden" name="id">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
						<h4 class="modal-title" id="myModalLabel">Delete Post</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="id">
						Are you sure you want to delete this posts?
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
