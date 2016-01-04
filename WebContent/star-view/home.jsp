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
<link rel="stylesheet"
	href="<c:url value='/star-css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/home.css'/>" />

</head>

<body>
	<div id="content" class="container-fluid">
		<nav class="navbar navbar-inverse" role="navigation">
   			<div class="navbar-header">
      			<a class="navbar-brand" href="#">W3Cschool</a>
   			</div>
   		<div>
      		<ul class="nav navbar-nav">
         		<li class="active"><a href="#">iOS</a></li>
         		<li><a href="#">SVN</a></li>
         		<li><a href="#">Java</a></li>
      		</ul>
   		</div>
		</nav>
		<!-- /nav bar -->
		<div class="row">
			<div class="col-md-3" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <h4>第一列</h4>
         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
      </div>
      <div class="col-md-9" style="background-color: #dedef8;box-shadow: 
         inset 1px -1px 1px #444, inset -1px 1px 1px #444;">
         <div class="row">
         <div><span>first row</span></div>
         </div>
         <div class="row">
         <div><span>second row</span></div>
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
