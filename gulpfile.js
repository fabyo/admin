var elixir = require('laravel-elixir');

elixir(function(mix) {
	mix.copy('vendor/caouecs/laravel-lang/src/pt-BR', 'resources/lang/pt_BR');
	
	mix.sass('app.scss', 'resources/assets/css/all.css');
    mix.less('app.less', 'resources/assets/css/admin-lte.css');

    mix.copy('node_modules/bootstrap-sass/assets/fonts/bootstrap', 'public/build/fonts');
    mix.copy('node_modules/font-awesome/fonts', 'public/build/fonts');
	mix.copy('node_modules/bootstrap-sass/assets/javascripts/bootstrap.js', 'resources/assets/js/bootstrap.js');
	mix.copy('node_modules/jquery/dist/jquery.js', 'resources/assets/js/jquery.js');
    mix.copy('node_modules/admin-lte/dist/css/skins/_all-skins.css', 'resources/assets/css/admin-lte-skin.css');
	mix.copy('node_modules/admin-lte/dist/js/app.js', 'resources/assets/js/admin-lte.js');
	mix.copy('node_modules/admin-lte/plugins/select2/select2.css', 'resources/assets/css/select2.css');
	mix.copy('node_modules/admin-lte/plugins/select2/select2.full.js', 'resources/assets/js/select2.js');
	mix.copy('node_modules/admin-lte/plugins/slimScroll/jquery.slimscroll.js', 'resources/assets/js/jquery.slimscroll.js');
	
    mix.styles([
        'all.css',
        'admin-lte.css',
        'admin-lte-skin.css',
        'select2.css'
    ]);

    mix.scripts([
        'jquery.js',
        'bootstrap.js',
        'jquery.slimscroll.js',
		'select2.js',
        'admin-lte.js'
    ]);
	
	mix.version(['css/all.css', 'js/all.js']);
});
