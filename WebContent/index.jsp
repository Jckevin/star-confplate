<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="configure plateform">
<meta name="author" content="Lings">

<title>Bootstrap</title>
<link rel="shortcut icon" href="<c:url value='/star-img/star1.png'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/login.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/magic/magic.css'/>" />
</head>

<body>
	<div class="container">
		<div class="text-center">
			<img src="<c:url value='/star-img/logo.png'/>" alt="Metis Logo">
		</div>
		<div class="tab-content">
			<div id="login" class="tab-pane active">
				<form action="index.html" class="form-signin">
					<p class="muted text-center">Enter your username and password</p>
					<input type="text" placeholder="Username" class="input-block-level">
					<input type="password" placeholder="Password"
						class="input-block-level">
					<button class="btn btn-large btn-primary btn-block" type="submit">Sign
						in</button>
				</form>
			</div>
			<div id="forgot" class="tab-pane">
				<form action="index.html" class="form-signin">
					<p class="muted text-center">Enter your valid e-mail</p>
					<input type="email" placeholder="mail@domain.com"
						required="required" class="input-block-level"> <br /> <br>
					<button class="btn btn-large btn-danger btn-block" type="submit">Recover
						Password</button>
				</form>
			</div>
			<div id="signup" class="tab-pane">
				<form action="index.html" class="form-signin">
					<input type="text" placeholder="username" class="input-block-level">
					<input type="email" placeholder="mail@domain.com"
						class="input-block-level"> <input type="password"
						placeholder="password" class="input-block-level">
					<button class="btn btn-large btn-success btn-block" type="submit">Register</button>

				</form>
			</div>
		</div>
		<div class="text-center">
			<ul class="inline">
				<li><a class="muted" href="#login" data-toggle="tab">Login</a></li>
				<li><a class="muted" href="#forgot" data-toggle="tab">Forgot
						Password</a></li>
				<li><a class="muted" href="#signup" data-toggle="tab">Signup</a></li>
			</ul>
		</div>


	</div>
	<!-- /container -->

	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>
	<script>
    $('.inline li > a').click(function() {
      var activeForm = $(this).attr('href') + ' > form';
      //console.log(activeForm);
      $(activeForm).addClass('magictime swap');
      //set timer to 1 seconds, after that, unload the magic animation
      setTimeout(function() {
        $(activeForm).removeClass('magictime swap');
      }, 1000);
    });
  </script>
</body>
</html>
