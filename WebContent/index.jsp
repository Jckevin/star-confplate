<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<meta name="description" content="">
<meta name="author" content="Lings">
<link rel="shortcut icon" type="image/x-icon"
	href="<c:url value='/star-img/star1.png'/>" media="screen" />

<title>Bootstrap</title>
<!-- Bootstrap core CSS -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/star-css/bootstrap.min.css'/>" media="screen" />

<!-- Custom styles for this template -->
<link rel="stylesheet" type="text/css"
	href="<c:url value='/star-css/non-responsive.css'/>" media="screen" />

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script type="text/javascript"
	src="<c:url value='/javascripts/assets/ie-emulation-modes-warning.js'/>"></script>


<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!-- Fixed navbar -->
    <nav class="navbar navbar-default navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <!-- The mobile navbar-toggle button can be safely removed since you do not need it in a non-responsive implementation -->
          <a class="navbar-brand" href="#">Project name</a>
        </div>
        <!-- Note that the .navbar-collapse and .collapse classes have been removed from the #navbar -->
        <div id="navbar">
          <ul class="nav navbar-nav">
            <li class="active"><a href="#">Home</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="#">Action</a></li>
                <li><a href="#">Another action</a></li>
                <li><a href="#">Something else here</a></li>
                <li role="separator" class="divider"></li>
                <li class="dropdown-header">Nav header</li>
                <li><a href="#">Separated link</a></li>
                <li><a href="#">One more separated link</a></li>
              </ul>
            </li>
          </ul>
          <form class="navbar-form navbar-left" role="search">
            <div class="form-group">
              <input type="text" class="form-control" placeholder="Search">
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
          </form>
          <ul class="nav navbar-nav navbar-right">
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

      <div class="page-header">
        <h1>Non-responsive Bootstrap</h1>
        <p class="lead">Disable the responsiveness of Bootstrap by fixing the width of the container and using the first grid system tier. <a href="http://getbootstrap.com/getting-started/#disable-responsive">Read the documentation</a> for more information.</p>
      </div>

      <h3>What changes</h3>
      <p>Note the lack of the <code>&lt;meta name="viewport" content="width=device-width, initial-scale=1"&gt;</code>, which disables the zooming aspect of sites in mobile devices. In addition, we reset our container's width and changed the navbar to prevent collapsing, and are basically good to go.</p>

      <h3>Regarding navbars</h3>
      <p>As a heads up, the navbar component is rather tricky here in that the styles for displaying it are rather specific and detailed. Overrides to ensure desktop styles display are not as performant or sleek as one would like. Just be aware there may be potential gotchas as you build on top of this example when using the navbar.</p>

      <h3>Browsers, scrolling, and fixed elements</h3>
      <p>Non-responsive layouts highlight a key drawback to fixed elements. <strong class="text-danger">Any fixed component, such as a fixed navbar, will not be scrollable when the viewport becomes narrower than the page content.</strong> In other words, given the non-responsive container width of 970px and a viewport of 800px, you'll potentially hide 170px of content.</p>
      <p>There is no way around this as it's default browser behavior. The only solution is a responsive layout or using a non-fixed element.</p>

      <h3>Non-responsive grid system</h3>
      <div class="row">
        <div class="col-xs-4">One third</div>
        <div class="col-xs-4">One third</div>
        <div class="col-xs-4">One third</div>
      </div>

    </div> <!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script type="text/javascript"
		src="<c:url value='/star-js/assets/ie10-viewport-bug-workaround.js'/>"></script>
</body>
</html>
