<?php

    namespace App\Http\Controllers;

    use Auth;

    class AuthController extends Controller
    {
        /**
         * Handle an authentication attempt.
         *
         * @return Response
         */
        public function authenticate()
        {
            if (Auth::attempt(['email' => $email, 'password' => $password])) {
                // Authentication passed...
                return redirect()->intended('dashboard');
            }

            if (Auth::attempt(['email' => $email, 'password' => $password], $remember)) {
                // The user is being remembered...
            }
			
			session()->flash('flash_message_type', BOOTSTRAP_SUCCESS);
			session()->flash('flash_message', 'UHU DEU CERTO SEM PACOTES');
        }
    }
