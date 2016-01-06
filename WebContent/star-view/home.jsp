<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">W3Cschool</a>
				</div>
				<div>
					<ul class="nav navbar-nav">
						<li class="active"><a href="#">iOS</a></li>
						<li><a href="#">SVN</a></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> Java <b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a href="#">jmeter</a></li>
								<li><a href="#">EJB</a></li>
								<li><a href="#">Jasper Report</a></li>
								<li class="divider"></li>
								<li><a href="#">分离的链接</a></li>
								<li class="divider"></li>
								<li><a href="#">另一个分离的链接</a></li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="row">
			<div id="left" class="col-md-2">
				<div class="row">
					<div class="col-md-4 head-pic">
						<img src="star-img/user.gif" alt="head pic" class="img-thumbnail">
					</div>
					<div class="col-md-8 login-status">
						<ul>
							<li><span class="glyphicon glyphicon-user"></span><a href="#">sysadmin</a></li>
							<li>Last Access : <small><i class="glyphicon glyphicon-calendar"></i> 16 Mar 16:32</small>
							</li>
						</ul>
					</div>
				</div>
				<div class="panel-group" id="panel-421963">
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="panel-title" data-toggle="collapse"
								data-parent="#panel-421963" href="#panel-element-880109">Collapsible
								Group Item #1</a>
						</div>
						<div id="panel-element-880109" class="panel-collapse collapse in">
							<div class="panel-body">Anim pariatur cliche...</div>
						</div>
					</div>
					<div class="panel panel-default">
						<div class="panel-heading">
							<a class="panel-title" data-toggle="collapse"
								data-parent="#panel-421963" href="#panel-element-254815">Collapsible
								Group Item #2</a>
						</div>
						<div id="panel-element-254815" class="panel-collapse collapse">
							<div class="panel-body">Anim pariatur cliche...</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-10">
				<div class="row">
					<div class="col-md-12">
						<div class="btn-group btn-group-xs">

							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-align-left"></em> Left
							</button>
							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-align-center"></em> Center
							</button>
							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-align-right"></em> Right
							</button>
							<button class="btn btn-default" type="button">
								<em class="glyphicon glyphicon-align-justify"></em> Justify
							</button>
						</div>
						<h3>h3. Lorem ipsum dolor sit amet.</h3>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>#</th>
									<th>Product</th>
									<th>Payment Taken</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Default</td>
								</tr>
								<tr class="active">
									<td>1</td>
									<td>TB - Monthly</td>
									<td>01/04/2012</td>
									<td>Approved</td>
								</tr>
								<tr class="success">
									<td>2</td>
									<td>TB - Monthly</td>
									<td>02/04/2012</td>
									<td>Declined</td>
								</tr>
								<tr class="warning">
									<td>3</td>
									<td>TB - Monthly</td>
									<td>03/04/2012</td>
									<td>Pending</td>
								</tr>
								<tr class="danger">
									<td>4</td>
									<td>TB - Monthly</td>
									<td>04/04/2012</td>
									<td>Call in to confirm</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /container -->

	<script type="text/javascript"
		src="<c:url value='/star-js/jquery-1.11.3.min.js'/>"></script>
	<script type="text/javascript"
		src="<c:url value='/star-js/bootstrap.min.js'/>"></script>
	<script type="text/javascript">
    $(document).ready(function() {
      $("#submitBtn").click(function(e) {
        e.preventDefault();
        var obj = $(this);
        var name = $("input[name='loginname']").val();
        var passwd = $("input[name='loginpasswd']").val();
        $.ajax({
          url : "loginCheck",
          type : "POST",
          contentType : "application/json;charset=utf-8",
          data : JSON.stringify({
            'loginname' : name,
            'loginpasswd' : passwd
          }),
          dataType : "json",
          success : function(result, status, req) {
            if (result.statusCode == "0") {
              obj.parents('form').submit();
            } else {
              $(".noticeInfo").css("display", "block").text(result.reasonCode);
            }
          },
          error : function(req, status, reason) {
            $(".noticeInfo").css("display", "block").text('Error:' + reason);
          }
        })
        return false;
      })
      $("#lang_zh").click(function() {
        $.ajax({
          url : "langSet",
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
      $("#lang_en").click(function() {
        $.ajax({
          url : "langSet",
          type : "GET",
          contentType : "application/text;charset=utf-8",
          data : {
            'langChoose' : 'en_US'
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
