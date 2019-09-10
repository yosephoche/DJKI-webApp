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
                        
                        {{-- image --}}
                        <div class="col-md-4 col-sm-6" id="image" style="display:none">
                            <div class="col-md-4 col-sm-6">
                                <label>Featured image</label>
                                    <div class="form-group">
                                        <img id="previewImage_-" data-toggle="modal" data-target="#modal-galleries" src="{{ asset('uploaded/media/default.jpg') }}" width="100%">
                                            <input type="hidden" name="image" id="targetValue_-">
                                             @include('admin.images.modals')
                                    </div>
						    </div>
                        </div>

                        <div class="col-md-5 col-sm-6">
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

@section('registerscript')
    <script type="text/javascript">
    /* slide */
        $("#pilihan").change(function () {
        var select = document.querySelector('#pilihan')
        if (select.value != '2') {
            document.querySelector('#title').style.display = 'block';
            document.querySelector('#image').style.display = 'block';
            document.querySelector('#category').style.display = 'block';
            document.querySelector('#link').style.display = 'block';
            document.querySelector('#linkvid').style.display = 'none';
        } else {
            document.querySelector('#title').style.display = 'none';
            document.querySelector('#image').style.display = 'none';
            document.querySelector('#category').style.display = 'block';
            document.querySelector('#link').style.display = 'none';
            document.querySelector('#linkvid').style.display = 'block';
        }

        });
        /* endslide */
    </script>
@endsection