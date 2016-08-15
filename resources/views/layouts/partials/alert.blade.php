@if(session()->has('flash_message'))
	<div class="alert alert-{{ session('flash_message_type') }}">
		<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>

		<strong>
			<i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
			{{ session()->get('flash_message') }}
		</strong>
	</div>
@endif