<?php

namespace FGO\Http\Middleware;

use Spatie\Authorize\Middleware\Authorize as BaseAuthorize;
use Symfony\Component\HttpFoundation\Response;
use Closure;

class Authorize extends BaseAuthorize
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
        return response('I am a teapot.', Response::HTTP_I_AM_A_TEAPOT);
    }
}
