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
<link rel="stylesheet"
	href="<c:url value='/star-css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/login.css'/>" />

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-offset-5 col-lg-2 col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6">
				<form role="form">
					<div class="input-group">
						<span class="input-group-addon">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="text"
							class="form-control" placeholder="twitterhandle">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">Password</span> <input type="text"
							class="form-control">
					</div>
				</form>
			</div>
		</div>
		
		<div class="row">
			<div class="form-signin">
				<form role="form">
					<div class="text-center">
						<img src="<c:url value='/star-img/logo.png'/>" alt="Metis Logo">
					</div>
					<div class="input-group">
						<span class="input-group-addon">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span> <input type="text"
							class="form-control" placeholder="twitterhandle">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">Password</span> <input type="text"
							class="form-control">
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- /container -->

	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>

</body>
</html>
