@extends('front.djki.partial.contents')
@section('contents')
  @if ({{ Request::is('/blog/*?lang=en') }})
    {!!$post->content!!}
  @else
    {!!$post->content_en !!}
  @endif
@endsection
