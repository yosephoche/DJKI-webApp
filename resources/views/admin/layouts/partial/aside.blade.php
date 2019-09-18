<?php $status = Auth::user()->status; ?>
<aside id="aside" class="app-aside hidden-xs bg-black">
	<div class="aside-wrap">
		<div class="navi-wrap">
			<!-- user -->
			<div class="clearfix hidden-xs text-center hide" id="aside-user">
				<div class="dropdown wrapper">
					<a href="app.page.profile">
						<span class="thumb-lg w-auto-folded avatar m-t-sm">
							<img src="{{ asset('uploaded').'/thumb-'.Auth::user()->image }}" class="img-full" alt="...">
						</span>
					</a>
					<a href="#" data-toggle="dropdown" class="dropdown-toggle hidden-folded">
						<span class="clear">
							<span class="block m-t-sm">
								<strong class="font-bold text-lt">{{ Auth::user()->fullname }}</strong>
								<b class="caret"></b>
							</span>
							<span class="text-muted text-xs block">{{ $status }}</span>
						</span>
					</a>
					<!-- dropdown -->
					<ul class="dropdown-menu animated bounceIn w hidden-folded">
						<li>
							<a href="{{ route('setting') }}">
								<span class="badge bg-danger pull-right">30%</span>
								<span>Settings</span>
							</a>
						</li>
						<li><a href="page_profile.html">Profile</a></li>
						<li><a href="page_help.html">Help</a></li>
						<li class="divider"></li>
						<li>
							<a href="{{ route('logout') }}"
								onclick="event.preventDefault();
										 document.getElementById('logout-form').submit();">
								Logout
							</a>
							<form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
								{{ csrf_field() }}
							</form>
						</li>
					</ul>
					<!-- / dropdown -->
				</div>
				<div class="line dk hidden-folded"></div>
			</div>
			<!-- / user -->

			<!-- nav -->
			<nav ui-nav class="navi clearfix">
				<ul class="nav">
					<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
						<span>Main Menus</span>
					</li>
					<li>
						<a href="https://play.google.com/store/apps/details?id=id.co.dgip" target="_blank">
							<i class="icon-screen-desktop text-warning"></i>
							<span>View this app</span>
						</a>
					</li>
					<li {{ Request::is('admin') ? 'class=active' : '' }}>
						<a href="{{ route('dashboard') }}">
							<i class="glyphicon glyphicon-stats icon text-primary-dker"></i>
							<span>Dashboard</span>
						</a>
					</li>

					{{-- @if ($status != 'Writer')
					<li {{ Request::is('admin/mail*') ? 'class=active' : '' }}>
						<a href="{{ route('messages') }}">
							@php
								$count_messages = DB::table('messages')->where('type', 'inbox')->where('read_status', '0')->where('deleted_at', null)->count();
							@endphp
							@if ($count_messages != 0)
								<b class="badge bg-primary pull-right">{{ $count_messages }}</b>
							@endif
							<i class="glyphicon glyphicon-envelope icon text-info-lter"></i>
							<span>Messages</span>
						</a>
					</li>
					@endif --}}

					@if ($status == 'Super Admin' OR $status == 'Admin')

					{{-- <li {{ Request::is('admin/template*') ? 'class=active' : '' }}>
						<a href="{{ route('templates_list') }}">
							<i class="fa fa-th text-warning"></i>
							<span>Template</span>
						</a>
					</li> --}}

					<li {{ Request::is('admin/customizer*') ? 'class=active' : '' }}>
						<a href="{{ route('templates_customizer') }}">
							<i class="fa fa-hashtag text-danger"></i>
							<span>Customizer</span>
						</a>
					</li>

					{{-- <li {{ Request::is('admin/subscribers*') ? 'class=active' : '' }}>
						<a href="{{ route('subscribers') }}">
							<i class="icon-paper-plane"></i>
							<span>Subscribers</span>
						</a>
					</li> --}}
					@endif

					@if ($status != 'Customer Service')
					<li class="line dk"></li>

					<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
						<span>Features</span>
					</li>
					@endif

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/about*') ? 'class=active' : '' }}>
						<a href="{{ route('about') }}">
							<i class="fa fa-building-o"></i>
							<span>About</span>
						</a>
					</li>
					@endif --}}

					@if ($status != 'Customer Service')
					<li {{ Request::is('admin/posts*') ? 'class=active' : '' }}>
						<a href="{{ route('posts') }}">
							<i class="icon-note"></i>
							<span>Posts</span>
						</a>
					</li>
					@endif

					@if ($status != 'Customer Service')
					<li {{ Request::is('admin/category*') ? 'class=active' : '' }}>
						<a href="{{ route('category') }}">
							<i class="fa fa-circle"></i>
							<span>Category</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('dtcms/pages*') ? 'class=active' : '' }}>
						<a href="{{ route('pages') }}">
							<i class="icon-doc"></i>
							<span>Pages</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('dtcms/comment*') ? 'class=active' : '' }}>
						<a href="{{ route('comments') }}">
							<i class="far fa-comment"></i>
							<span>Comment</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/menus*') ? 'class=active' : '' }}>
						<a href="{{ route('menus',['option'=>'header']) }}">
							<i class="icon-list"></i>
							<span>Menus</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/horizontal*') ? 'class=active' : '' }}>
						<a href="{{ route('menuhorizontal',['option'=>'header']) }}">
							<i class="fa fa-bars"></i>
							<span>Menus Horizontal</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/slideshow*') ? 'class=active' : '' }}>
						<a href="{{ route('slideshow') }}">
							<i class="icon-control-play"></i>
							<span>Slideshow</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/media*') ? 'class=active' : '' }}>
						<a href="{{ route('media') }}">
							<i class="fa fa-picture-o"></i>
							<span>Media</span>
						</a>
					</li>
					@endif

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/archive*') ? 'class=active' : '' }}>
						<a href="{{ route('archive') }}">
							<i class="fa fa-folder"></i>
							<span>Directory</span>
						</a>
					</li>
					@endif

					{{-- Maps Aside --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/maps*') ? 'class=active' : '' }}>
						<a href="{{ route('maps-index') }}">
							<i class="fa fa-map-marker"></i>
							<span>Maps</span>
						</a>
					</li>
					@endif --}}

					{{-- Parnertship --}}

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/partnership*') ? 'class=active' : '' }}>
						<a href="{{ route('partnership-index') }}">
							<i class="fa fa-handshake"></i>
							<span>Partnership</span>
						</a>
					</li>
					@endif



					{{-- End Maps --}}
					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/portfolio*') ? 'class=active' : '' }}>
						<a href="{{ route('portfolio') }}">
							<i class="icon-grid"></i>
							<span>Portfolio</span>
						</a>
					</li>
					@endif --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/testimonials*') ? 'class=active' : '' }}>
						<a href="{{ route('testimonials') }}">
							<i class="icon-check"></i>
							<span>Testimonials</span>
						</a>
					</li>
					@endif --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/client*') ? 'class=active' : '' }}>
						<a href="{{ route('client') }}">
							<i class="icon-emoticon-smile"></i>
							<span>Client</span>
						</a>
					</li>
					@endif --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/services*') ? 'class=active' : '' }}>
						<a href="{{ route('services') }}">
							<i class="icon-compass"></i>
							<span>Services</span>
						</a>
					</li>
					@endif --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/event*') ? 'class=active' : '' }}>
						<a href="{{ route('event') }}">
							<i class="icon-cup"></i>
							<span>Event</span>
						</a>
					</li>
					@endif --}}

					{{-- @if ($status == 'Super Admin' OR $status == 'Admin')
					<li {{ Request::is('admin/career*') ? 'class=active' : '' }}>
						<a href="{{ route('career') }}">
							<i class="fa fa-search"></i>
							<span>Career</span>
						</a>
					</li>
					@endif --}}

					<li class="line dk hidden-folded"></li>

					@if ($status == 'Super Admin' OR $status == 'Admin')
					<li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
						<span>Configure</span>
					</li>

					<li {{ Request::is('admin/team*') ? 'class=active' : '' }}>
						<a href="{{ route('team') }}">
							<i class="icon-users icon text-success-lter"></i>
							<span>Team</span>
						</a>
					</li>
					<li {{ Request::is('admin/setting*') ? 'class=active' : '' }}>
						<a href="{{ route('setting') }}">
							<i class="icon-settings icon"></i>
							<span>Setting</span>
						</a>
					</li>
					@endif
				</ul>
			</nav>
			<!-- nav -->

			<!-- aside footer -->
			@php $exp = DB::table('setting')->select('expired_at')->count(); @endphp
			@if ($exp == true)
				<?php
					$exp = DB::table('setting')->select('expired_at')->first();
					$d1 = new DateTime(Carbon\Carbon::now());
					$d2 = new DateTime($exp->expired_at);
					$total = ($d1->diff($d2)->m + ($d1->diff($d2)->y*12));
				 ?>
				<div class="wrapper m-t hide">
					<div class="text-center-folded">
						<span class="pull-right pull-none-folded">{{ Carbon\Carbon::parse($exp->expired_at)->diffForHumans() }}</span>
						<span class="hidden-folded">Expire</span>
					</div>
					<div class="progress progress-xxs m-t-sm dk">
						<div class="progress-bar progress-bar-{{ $total <= 2 ? 'warning' : 'info' }}" style="width: calc(100% / 12 * {{ 12 - $total }});">
						</div>
					</div>
				</div>
			@endif
		</div>
	</div>
</aside>
