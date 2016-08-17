<?php

namespace FGO\Providers;

use Illuminate\Support\ServiceProvider;
use Carbon\Carbon;

class CarbonLanguageProvider extends ServiceProvider
{
    /**
     * Bootstrap the application services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }

    /**
     * Register the application services.
     *
     * @return void
     */
    public function register()
    {
		//setlocale(LC_ALL, 'pt_BR', 'pt_BR.utf-8', 'pt_BR.utf-8', 'portuguese');
        // gets the locale from parameter
        // set the current request app locale
        //app()->setLocale('pt_BR');

        Carbon::setLocale($this->app->getLocale());
    }
}
