<?php
	
Route::get('login', 'AuthController@login');
Route::post('login', 'AuthController@attempt');

Route::get('register', 'AuthController@register');
Route::post('logout', 'AuthController@logout');

Route::get('/', 'HomeController@index');
