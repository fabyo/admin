<?php
	
Route::get('auth/login', 'auth\AuthController@login');
Route::post('auth/login', 'auth\AuthController@attempt');

//Route::get('register', 'AuthController@register');
//Route::get('logout', 'AuthController@logout');

//Route::get('/', 'HomeController@index');
//Route::get('password/reset', 'AuthController@reset');

//Route::group(['prefix' => 'admin', 'middleware' => 'can:auth'], function() {

//});

Route::get('/', 'HomeController@index');