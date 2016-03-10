<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="lang" value="zh_CN" />
<c:if test="${!(empty sessionScope.langSet)}">
	<c:set var="lang" value="${sessionScope.langSet}" />
</c:if>
<fmt:setLocale value="${lang}" />
<fmt:setBundle
	basename="com.starunion.jee.confplate.resi18n.starResBundle"
	var="langRes" scope="session" />
	
<!DOCTYPE html>
<html lang="zh-CN">	
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="configure plateform">
<meta name="author" content="Lings">

<title><fmt:message key="companyname" bundle="${langRes}" /></title>
<link rel="shortcut icon" href="<c:url value='/star-img/star1.png'/>" />
<link rel="stylesheet"
	href="<c:url value='/star-css/bootstrap.min.css'/>" />
<link rel="stylesheet" href="<c:url value='/star-css/login.css'/>" />

</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="form-signin">
				<form action="home" method="POST" role="form">
					<div class="text-center">
						<a id="lang_zh" href="#"><fmt:message key="lang.zh" bundle="${langRes}" /></a>
						<a id="lang_en" href="#"><fmt:message key="lang.en" bundle="${langRes}" /></a>
					</div>
					<br>
					<div class="text-center">
						<img src="<c:url value='/star-img/logo1.png'/>" alt="StarSky Logo">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon"><fmt:message
								key="loginname" bundle="${langRes}" /></span> <input name="loginname"
							type="text" class="form-control" placeholder="twitterhandle">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon"><fmt:message
								key="loginpass" bundle="${langRes}" /></span> <input
							name="loginpasswd" type="password" class="form-control">
					</div>
					<br>
					<div class="text-center">
						<span class="noticeInfo"><fmt:message
								key="loginerr" bundle="${langRes}" /></span>
					</div>
					<div class="text-center">
						<button type="submit" id="submitBtn"
							class="btn btn-info btn-block">
							<fmt:message key="loginsubmit" bundle="${langRes}" />
						</button>
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
            if (result.result == "0") {
              obj.parents('form').submit();
            } else {
              //$(".noticeInfo").css("display", "block").text(result.reasonCode);
              $(".noticeInfo").css("display", "block");
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
