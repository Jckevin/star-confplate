<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${!(empty sessionScope.menutree)}">
	<c:set var="tree" value="${sessionScope.menutree}" />
</c:if>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="configure plateform">
<meta name="author" content="Lings">

<title><fmt:message key="confcenter" bundle="${langRes}" /></title>
<link rel="shortcut icon" href="<c:url value='/star-img/star1.png'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/bootstrap.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/star-css/bootstrap-theme.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/style.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/star-css/skins/_all-skins.min.css'/>">
</head>

<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<!-- Logo -->
			<a href="index2.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>S.</b>A.</span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>Star</b>Ally</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top" role="navigation">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>
				<!-- Navbar Right Menu -->
				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<!-- Messages: style can be found in dropdown.less-->
						<li class="dropdown messages-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="glyphicon glyphicon-envelope"></i> <span
								class="label label-success">4</span>
						</a></li>
						<!-- Notifications: style can be found in dropdown.less -->
						<li class="dropdown notifications-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="glyphicon glyphicon-bell"></i> <span
								class="label label-warning">10</span>
						</a></li>
						<!-- Tasks: style can be found in dropdown.less -->
						<li class="dropdown tasks-menu"><a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="glyphicon glyphicon-flag"></i> <span
								class="label label-danger">9</span>
						</a></li>
						<!-- User Account: style can be found in dropdown.less -->
						<li class="dropdown user user-menu"><a href="logout"
							class="dropdown-toggle" data-toggle="dropdown"> <i
								class="glyphicon glyphicon-log-out"></i><span class="hidden-xs"><fmt:message
										key="logout" bundle="${langRes}" /></span>
						</a></li>
					</ul>
				</div>

			</nav>
		</header>
		<!-- Left side column. contains the logo and sidebar -->
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- search form -->
				<form action="#" method="get" class="sidebar-form">
					<div class="input-group">
						<input type="text" name="q" class="form-control"
							placeholder="Search..."> <span class="input-group-btn">
							<button type="submit" name="search" id="search-btn"
								class="btn btn-flat">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</span>
					</div>
				</form>
				<!-- /.search form -->
				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<li class="header">MAIN NAVIGATION</li>
					<c:forEach items="${menutree}" var="tree">
						<li class="treeview"><a href="#"><i
								class="${tree.treeNodePic}"></i> <span><fmt:message
										key="${tree.treeNodeName}" bundle="${langRes}" /></span> </a>
							<ul class="treeview-menu">
								<c:forEach items="${tree.subNodeList}" var="subTree">
									<li><a class="${subTree.type}" href="${subTree.action}"><i
											class="${subTree.pic}"></i> <fmt:message
												key="${subTree.name}" bundle="${langRes}" /></a></li>
								</c:forEach>
							</ul></li>
					</c:forEach>
					<li><a href="pages/widgets.html"> <i
							class="glyphicon glyphicon-th"></i> <span>Widgets</span> <small
							class="label pull-right bg-green">new</small>
					</a></li>

					<li class="header">LABELS</li>
					<li><a href="#"><i
							class="glyphicon  glyphicon-star-empty text-red"></i> <span>Important</span></a></li>
					<li><a href="#"><i
							class="glyphicon  glyphicon-star-empty text-yellow"></i> <span>Warning</span></a></li>
					<li><a href="#"><i
							class="glyphicon  glyphicon-star-empty text-aqua"></i> <span>Information</span></a></li>
				</ul>
			</section>
		</aside>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					<fmt:message key="softname" bundle="${langRes}" />
					<small><fmt:message key="softver" bundle="${langRes}" /></small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="glyphicon glyphicon-home"></i> <fmt:message
								key="home" bundle="${langRes}" /></a></li>
					<li id="nodeLoc" class="active"><fmt:message key="home"
							bundle="${langRes}" /></li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="box box-primary">
					<div class="col-md-6 col-sm-8 col-xs-12">
						<form id="actform" class="form-horizontal">
							<div id="actformdiv" class="box-body">
								<!-- here ajax produce actively -->
							</div>
							<!-- /.box-body -->
						</form>
					</div>
				</div>
			</section>

		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 2.3.0
			</div>
			<strong>Copyright &copy; 2014-2015 <a
				href="http://almsaeedstudio.com">Almsaeed Studio</a>.
			</strong> All rights reserved.
		</footer>
		<aside class="control-sidebar control-sidebar-dark"></aside>
	</div>
	<!-- /container -->

	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/star-js/app.min.js'/>"></script>

	<script type="text/javascript">
    $(document)
        .ready(
            function() {
              $(".ajaxNode")
                  .click(
                      function(e) {
                        e.preventDefault();
                        var obj = $(this);
                        var act = obj.attr("href");
                        $
                            .ajax({
                              url : act,
                              type : "GET",
                              contentType : "application/text;charset=utf-8",
                              data : {
                                "node" : act
                              },
                              dataType : "json",
                              success : function(result, status, req) {
                                $("#nodeLoc").html(result.node);
                                $("#actform").attr("action","setipv4");
                                var htmcont = "<br>";
                                var subResult = result.insMap;
                                $
                                    .each(
                                        subResult,
                                        function(ky, vl) {
                                          htmcont += "<div class=\"form-group\">"
                                          htmcont += "<label class=\"col-xs-3 control-label\">";
                                          htmcont += ky;
                                          htmcont += "</label>";
                                          htmcont += "<div class=\"col-xs-9\">";
                                          htmcont += "<input type=\"text\" class=\"form-control\" value=\"";
                                    htmcont += vl;
                                    htmcont += "\">";
                                          htmcont += "</div></div>";
                                        });
                                htmcont += "<div class=\"col-xs-3\"></div><div class=\"col-xs-9\"><button type=\"submit\" id=\"sss\" class=\"btn btn-primary pull-left\">";
                                htmcont += result.submit;
                                htmcont += "</button></div>";
                                $("#actformdiv").html(htmcont);
                                
                              },
                              error : function(req, status, reason) {
                                alert("ajax error !");
                              }
                            })

                        return false;
                      })
              $("#sss").click(function() {
                alert("aha click!");
                $.ajax({
                  url : "setGen",
                  type : "GET",
                  contentType : "application/text;charset=utf-8",
                  data : {
                    'langChoose' : 'zh_CN'
                  },
                  dataType : "text",
                  success : function(result, status, req) {
                    if (result == "success") {
                      window.location.reload();
                    }
                  }
                })
              })
            });
  </script>
</body>
</html>
