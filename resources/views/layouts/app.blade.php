<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>FGO System</title>
    <link href="{{ elixir('css/all.css') }}" rel="stylesheet">
</head>
<body class="hold-transition skin-blue fixed">
<div class="wrapper">	
  
	@if (Auth::check())
		@include('layouts.partials.header')
		@include('layouts.partials.sidebar')		
		
		<div class="content-wrapper">
			<section class="content">
				@include('partials.alert')
				@yield('content')
			</section>
		</div>

		@include('layouts.partials.footer')
	@endif		
	
	<script src="{{ elixir('js/all.js') }}"></script>
</body>
</html>
