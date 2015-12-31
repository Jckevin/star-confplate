<%@ page language="java" pageEncoding="utf-8"%>
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
			<div class="form-signin">
				<form action="login" method="POST" role="form">
					<div class="text-center">
						<img src="<c:url value='/star-img/logo1.png'/>" alt="StarSky Logo">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						<input name="loginname" type="text" class="form-control"
							placeholder="twitterhandle">
					</div>
					<br>
					<div class="input-group">
						<span class="input-group-addon">Password</span> <input
							name="loginpasswd" type="password" class="form-control">
					</div>
					<br>
					<div class="text-center">
						<span class="noticeInfo"></span>
					</div>
					<div class="text-center">
						<button type="submit" id="submitBtn"
							class="btn btn-info btn-block">Log In登录</button>
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
          url : "http://localhost:8080/star-confplate/loginCheck/",
          type : "POST",
          contentType: "application/json;charset=utf-8",
          data : JSON.stringify({'loginname':name,'loginpasswd':passwd}),
          dataType : "application/json",
          success : function(result) {
            alert(result);
            if (result == "success") {
              obj.parents('form').submit();
            } else {
              $(".noticeInfo").css("display","block").text("wrong name or wrong password!");
            }
          },
          error:function(msg){
            $(".noticeInfo").html('Error:'+msg);
          }
        })
        return false;
      })
    });
  </script>

</body>
</html>
