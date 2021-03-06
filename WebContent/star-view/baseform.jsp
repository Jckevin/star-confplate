<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:if test="${!(empty sessionScope.menutree)}">
	<c:set var="tree" value="${sessionScope.menutree}" />
</c:if>
<c:set var="menu" value="${menu}" />
<c:set var="node" value="${node}" />
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
	<style type="text/css">
</style>
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
						<c:choose>
							<c:when test="${tree.treeNodeName == menu}">
								<li class="active treeview"><a href="#"><i
										class="${tree.treeNodePic}"></i> <span><fmt:message
												key="${tree.treeNodeName}" bundle="${langRes}" /></span> </a>
							</c:when>
							<c:otherwise>
								<li class="treeview"><a href="#"><i
										class="${tree.treeNodePic}"></i> <span><fmt:message
												key="${tree.treeNodeName}" bundle="${langRes}" /></span> </a>
							</c:otherwise>
						</c:choose>

						<ul class="treeview-menu">
							<c:forEach items="${tree.subNodeList}" var="subTree">
								<c:choose>
									<c:when test="${subTree.name == node}">
										<li class="active">
									</c:when>
									<c:otherwise>
										<li>
									</c:otherwise>
								</c:choose>
								<a class="${subTree.type}" href="${subTree.action}"><i
									class="${subTree.pic}"></i> <fmt:message key="${subTree.name}"
										bundle="${langRes}" /></a>
								</li>
							</c:forEach>
						</ul>
						</li>
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
								key="${menu}" bundle="${langRes}" /></a></li>
					<li class="active"><fmt:message key="${node}"
							bundle="${langRes}" /></li>
				</ol>
			</section>
			<!-- The area used for extra data post -->
			<div>
				<input type="text" id="nodeLoc" value="${node}" style="display:none;"/>
			</div>
			<!-- Main content -->
			<section class="content">
			<div class="row">
				<div class="box box-primary">
					<div class="col-md-6 col-sm-8 col-xs-12">
						<form id="actfrm" class="form-horizontal" action="baseActionUpdate">
							<div class="box-body">
								<!-- here ajax produce actively -->
								<c:forEach items="${insList}" var="ins">
									<div class="form-group">
										<label class="col-xs-3 control-label"> <fmt:message
												key="${ins.name}" bundle="${langRes}" /></label>
										<div class="col-xs-9">
											<input type="text" name="${ins.name}" class="form-control"
												value="${ins.value}" />
										</div>
									</div>
								</c:forEach>
								<div class="col-xs-3"></div>
								<div class="col-xs-9">
									<button type="submit" class="btn btn-primary pull-left">
										<fmt:message key="submit" bundle="${langRes}" />
									</button>
								</div>
							</div>
							<!-- /.box-body -->
						</form>
					</div>
				</div>
				</div>
			</section>

		</div>
		<footer class="main-footer">
			<div class="pull-right hidden-xs">
				<b>Version</b> 1.0.0
			</div>
			<strong>Copyright &copy; 2014-2015 <a
				href="http://starunion.com">
				<fmt:message key="co.info" bundle="${langRes}" /></a>.
			</strong> All rights reserved.
		</footer>
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- /container -->

	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>
	<script src="<c:url value='/star-js/app.min.js'/>"></script>
	<script type="text/javascript">
    $(document).ready(function() {
      $(".btn").click(function(e) {
        e.preventDefault();
        var dataPara = getFormJson();
        var nodeLoc = $("#nodeLoc").val();
        $.ajax({
          url : "baseFormSubmit?nodeLoc="+nodeLoc,
          type : "POST",
          contentType : "application/json;charset=utf-8",
          data : JSON.stringify(dataPara),
          dataType : "json",
          success : function(result, status, req) {
            alert(result.result);
          },
          error : function(req, status, reason) {
            alert("ajax error !");
          }
        })

        return false;
      })

      function getFormJson() {
        var o = {};
        var a = $("#actfrm").serializeArray();
        $.each(a, function() {
          if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
              o[this.name] = [ o[this.name] ];
            }
            o[this.name].push(this.value || '');
          } else {
            o[this.name] = this.value || '';
          }
        });

        return o;
      }
    });
  </script>
</body>
</html>
