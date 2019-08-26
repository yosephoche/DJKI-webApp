@extends('admin.layouts.main')
@section('title', 'Maps Edit')
@section('contents')
	<div class="bg-light lter b-b wrapper-md">
		<h1 class="m-n font-thin h3">Edit Maps</h1>
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
				<form action="{{ route('maps-update',$maps->id) }}" method="post">
					{{ csrf_field() }}
					<div class="row">
						<div class="col-md-5">
							<div class="form-group">
                                <label for="">Longitude</label>
                            <input type="text" name="longitude" class="form-control" placeholder="Masukkan Longitude" value="{{$maps->longitude}}">
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                    <div class="form-group">
                                        <label for="">Latitude</label>
                                    <input type="text" name="latitude" class="form-control" placeholder="Masukkan Latitude" value="{{$maps->latitude}}">
                                    </div>
                                   </div>
                            </div>
							<input type="hidden" name="_method" value="PUT">
                            <button type="submit" class="btn  btn-success" style="margin-left:14px">Update</button>
				</form>
			</div>
		</div>
	</div>
@endsection
