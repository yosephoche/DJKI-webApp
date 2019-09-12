<!DOCTYPE html>
<html lang="en" class="">
<head>
	<title>@yield('title', 'Admin')</title>

	@include('admin.layouts.partial.meta')

	@yield('styles')
	<style>
		/* menu Setting index blade */
		.timeMaintenence {
			padding: 0;
		}

		.colTimezone, 
		.colFeaturedImg{
			padding-left: 0px;
		}

		.wrapSosmed input {
			margin-bottom: 1em;
		}

		/* .colContactMap, .sosmed {
			padding-left: 0px;
			padding-right: 0px;
		}

		.colEmail, .colAddress {
			padding-left: 0px;
		} */

		/* Index Posts */
		.max-width-image tr {
			padding-bottom: 10px;
			display: block;
		}

		.max-width-image img {
			max-width: 100% !important;
			width: auto !important;
			margin-right: 10px;
		}
	</style>
</head>
<body>
<div class="app app-header-fixed">


	<!-- header -->
	@include('admin.layouts.partial.header')
	<!-- / header -->

	<!-- aside -->
	@include('admin.layouts.partial.aside')
	<!-- / aside -->


	<!-- content -->
	<div id="content" class="app-content" role="main">
		<div class="app-content-body ">

			@yield('contents')

		</div>
	</div>
	<!-- /content -->

	<!-- footer -->
	@include('admin.layouts.partial.footer')
	<!-- / footer -->



</div>

	@include('admin.layouts.partial.modal')

	@yield('modal')

	<!-- Javascript Libraries -->
	@include('admin.layouts.partial.script')

	@yield('registerscript')

</body>
</html>
