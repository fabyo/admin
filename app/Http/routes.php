<?php
	
Route::get('login', 'auth\AuthController@login');
Route::post('login', 'auth\AuthController@attempt');

//Route::get('register', 'AuthController@register');
//Route::get('logout', 'AuthController@logout');

//Route::get('/', 'HomeController@index');
//Route::get('password/reset', 'AuthController@reset');

//Route::group(['prefix' => 'admin', 'middleware' => 'can:auth'], function() {

//});

Route::get('/', 'HomeController@index');

Route::get('permissoes', function(){

    $user = FGO\User::find(51);
    $permissions = $user->permissions;
    //echo $permissions;

    $roles = $user->roles()->pluck('name');

    //lista as regras criadas
    echo $roles;

    dd($user->can('regra1'));
});
