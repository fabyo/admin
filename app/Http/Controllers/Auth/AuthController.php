<?php

namespace FGO\Http\Controllers\Auth;

use Illuminate\Http\Request;
use FGO\Http\Controllers\Controller;
use Auth;

    class AuthController extends Controller
    {
        public function login()
        {
            return view('auth.login');
        }

        public function attempt(Request $request)
        {
            $this->validate($request, [
				'email'    => ['required', 'max:255', 'email'],
				'password' => ['required', 'min:6', 'max:255']	
			]);

			$credentials = $request->only(['email', 'password']);
			$remember    = $request->has('remember');
			
			if (! Auth::attempt($credentials, $remember)) {

				return redirect()->back()
					->with('flash_message_type', 'danger')
					->with('flash_message', 'Usuario ou senha invalido!')
					->withInput();
            }
			
			return redirect('/');
        }

        public function logout()
        {
            Auth::logout();

            return redirect('/');
        }

        public function reset()
        {
            return view('auth.passwords.reset');
        }

        public function email()
        {
            return view('auth.passwords.email');
        }
    }
