 <!-- Main Header -->
	<header class="main-header">
		<!-- Logo -->
		<a href="{{ url('/') }}" class="logo">
			<span class="logo-lg"><b>Galutti</b></span>
		</a>
		<!-- Header Navbar -->		
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>
			@if (Auth::check())
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Notifications Menu -->
					<li class="dropdown notifications-menu">
						<!-- Menu toggle button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bullhorn" aria-hidden="true"></i>
							<span class="label label-danger">10</span>
						</a>
						<ul class="dropdown-menu">
							<li class="header">Existe produtos abaixo do estoque</li>
							<li>
								<!-- Inner Menu: contains the notifications -->
								<ul class="menu">
									<li><!-- start notification -->
										<a href="#">
											<i class="fa fa-users text-aqua"></i> Visualizar
										</a>
									</li>
									<!-- end notification -->
								</ul>
							</li>
						</ul>
					</li>
					<!-- User Account Menu -->
					<li class="dropdown user user-menu">
						<!-- Menu Toggle Button -->
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<!-- The user image in the navbar-->
							<img src="img/avatar5.png" class="user-image" alt="User Image">
							<!-- hidden-xs hides the username on small devices so only the image appears. -->
							<span class="hidden-xs">Usuario</span>
						</a>
						<ul class="dropdown-menu">
							<!-- The user image in the menu -->
							<li class="user-header">
								<img src="img/avatar5.png" class="img-circle" alt="User Image">
								<p>
									Usuario - Web Developer
								</p>
							</li>
							<!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-right">
									<a href="#" class="btn btn-default btn-flat">
										<i class="fa fa-sign-out" aria-hidden="true"></i> Sair
									</a>
								</div>
							</li>
						</ul>
					</li>
					<!-- Control Sidebar Toggle Button -->
				</ul>
			</div>
			@endif
		</nav>
	</header>