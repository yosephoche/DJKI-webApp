@extends('front.djki.partial.contents')
@section('contents')
  @if ({{ Request::is('/blog/*?lang=en') }})
    {!!$post->content_en!!}
  @else
    {!! $post->content !!}
  @endif
@endsection
