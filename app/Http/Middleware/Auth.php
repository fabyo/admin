<?php

namespace FGO\Http\Middleware;

use Closure;
use Symfony\Component\HttpKernel\Exception\HttpException;

class Auth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        return $next($request);
    }

    protected function handleUnauthorizedRequest($request, $ability = null, $model = null)
    {
        if ($request->ajax()) {
            return response('Unauthorized.', Response::HTTP_UNAUTHORIZED);
        }

        if (!$request->user()) {
            return redirect()->guest(config('laravel-authorize.login_url'));
        }

        throw new HttpException(Response::HTTP_UNAUTHORIZED, 'This action is unauthorized.');
    }
}
