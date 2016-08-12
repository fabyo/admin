<?php
	
Route::get('login', 'AuthController@login');
Route::post('login', 'AuthController@attempt');

Route::get('register', 'AuthController@register');
Route::get('logout', 'AuthController@logout');

Route::get('/', 'HomeController@index');

Route::get('password/reset', 'AuthController@reset');
