<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Galutti System</title>
    <link href="{{ elixir('css/all.css') }}" rel="stylesheet">
</head>
<body class="hold-transition login-page">
    @if (count($errors) > 0)
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @elseif(session()->has('flash_message'))
        <div class="alert alert-danger">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
            <ul>
                <li>{{ session()->get('flash_message') }}</li>
            </ul>
        </div>
    @endif

    <div class="login-box">
        <div class="panel panel-primary">
            <div class="panel-heading">
                <i class="fa fa-lock" aria-hidden="true"></i> Login
            </div>
        <div class="panel-body">
        <form class="form-horizontal" role="form" method="POST" action="{{ url('/auth/login') }}">
        {{ csrf_field() }}
        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
			<div class="col-md-12">
				<div class="input-group margin-bottom-sm">
					<span class="input-group-addon" id="basic-addon1">
						<i class="fa fa-envelope-o fa-fw" aria-hidden="true"></i>
					</span>				
					<input type="email" class="form-control" name="email" value="{{ old('email') }}" placeholder="Email" aria-describedby="basic-addon1" required autofocus>
				</div>
			</div>          
		</div>
		
        <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
          <div class="col-md-12">		  
				<div class="input-group">
					<span class="input-group-addon">
						<i class="fa fa-key fa-fw" aria-hidden="true"></i>
					</span>				
					<input type="password" class="form-control" name="password" placeholder="Senha" style="-webkit-text-security: disc !important;" required>
				</div>
          </div>
        </div>

        <div class="form-group">
            <div class="col-md-12">
                <div class="checkbox checkbox-primary">
                    <input type="checkbox" id="check" name="remember" class="styled toggle" value="1" aria-label="checkbox">
                    <label for="check">
                        Lembrar Senha
                    </label>
                </div>
            </div>
        </div>

        <div class="form-group">
          <div class="col-md-12">
            <button type="submit" class="btn btn-primary">
              <i class="fa fa-btn fa-sign-in"></i> Entrar
            </button>

            <a class="btn btn-link" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">Esqueceu a senha?</a>
          </div>
        </div>
      </form>
    </div>
  </div>
  <!-- /.login-box-body -->
</div>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">Resetar senha</h4>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                    <i class="fa fa-btn fa-reply" aria-hidden="true"></i>
                    Cancelar
                </button>
                <button type="button" class="btn btn-primary">
                    <i class="fa fa-btn fa-envelope" aria-hidden="true"></i>
                    Enviar email
                </button>
            </div>
        </div>
    </div>
</div>

	<script src="{{ elixir('js/all.js') }}"></script>
</body>
</html>
