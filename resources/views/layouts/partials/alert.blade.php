@if(session()->has('flash_message'))
	<div class="alert alert-{{ session()->get('flash_message_type') }}">
		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		<i class="fa fa-exclamation fa-lg" aria-hidden="true"></i>
		{{ session()->get('flash_message') }}
	</div>
@endif