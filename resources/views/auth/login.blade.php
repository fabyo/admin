<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Galutti System</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">    
    <link href="{{ elixir('css/all.css') }}" rel="stylesheet">
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-lock" aria-hidden="true"></i> Login</div>
    <div class="panel-body">
      <form class="form-horizontal" role="form" method="POST" action="{{ url('/login') }}">
        {{ csrf_field() }}

        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
          <div class="col-md-12">
            <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email" autofocus>

            @if ($errors->has('email'))
              <span class="help-block">
                <strong>{{ $errors->first('email') }}</strong>
			  </span>
            @endif
          </div>
        </div>

        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
          <div class="col-md-12">
            <input id="password" type="password" class="form-control" name="password" placeholder="Senha">

            @if ($errors->has('password'))
              <span class="help-block">
                  <strong>{{ $errors->first('password') }}</strong>
              </span>
            @endif
          </div>
        </div>

        <div class="form-group">
          <div class="col-md-10">
            <button type="submit" class="btn btn-primary btn-flat">
              <i class="fa fa-btn fa-sign-in"></i> Entrar
            </button>

            <a class="btn btn-link" href="{{ url('/password/reset') }}">Esqueceu a senha?</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- /.login-box-body -->
</div>
	
	<script src="{{ elixir('js/all.js') }}"></script>
</body>
</html>
