<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Registration Confirmation Page</title>
	<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
		<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
		<style>
				html{
					background-color:#2F2F2F;
				}
				
				body{
					height: 100%;
					background-color:rgb(245, 245, 245);
				}
				
				
				#mainWrapper {
					height: 100%;
					background-image: -webkit-gradient(
					linear,
					right bottom,
					right top,
					color-stop(0, #EDEDED),
					color-stop(0.08, #EAEAEA),
					color-stop(1, #2F2F2F),
					color-stop(1, #AAAAAA)
				);
				background-image: -o-linear-gradient(top, #EDEDED 0%, #EAEAEA 8%, #2F2F2F 100%, #AAAAAA 100%);
				background-image: -moz-linear-gradient(top, #EDEDED 0%, #EAEAEA 8%, #2F2F2F 100%, #AAAAAA 100%);
				background-image: -webkit-linear-gradient(top, #EDEDED 0%, #EAEAEA 8%, #2F2F2F 100%, #AAAAAA 100%);
				background-image: -ms-linear-gradient(top, #EDEDED 0%, #EAEAEA 8%, #2F2F2F 100%, #AAAAAA 100%);
				background-image: linear-gradient(to top, #EDEDED 0%, #EAEAEA 8%, #2F2F2F 100%, #AAAAAA 100%);
				}
				
				.floatRight{
					float:right;
					margin-right: 18px;
				}
				
				.has-error{
					color:red;
				}
				
				.generic-container {
				  position:fixed;
				  width:80%;
				  margin-left: 20px;
				  margin-top: 20px;
				  margin-bottom: 20px;
				  padding: 20px;
				  background-color: #EAE7E7;
				  border: 1px solid #ddd;
				  border-radius: 4px;
				  box-shadow: 0 0 30px black;
				}
				
				.custom-width {
				    width: 80px !important;
				}
				
				body, #mainWrapper, .form-control{
					font-size:12px!important;
				}
				
				#mainWrapper {
					/*height: 720px; Without explicit px values, % in children's does not work*/
					height: 100vh; /*with Viewport-Percentage, we can handles all devices screens  */
					padding-left:10px;
					padding-right:10px;
					padding-bottom:10px;
				}
				
				.login-container {
				    margin-top: 100px;
				    background-color: floralwhite;
				    width: 40%;
				    left: 30%;
				    position: absolute;
				}
				
				.login-card {
				    width: 80%;
				    margin: auto;
				}
				
				.login-form {
				    padding: 10%;
				}
				
				.authbar{
					margin-bottom:15px;
				}
		</style>
</head>
<body>
	<div class="generic-container">
		<%@include file="authheader.jsp" %>
		
		<div class="alert alert-success lead">
	    	${success}
		</div>
		
		<span class="well floatRight">
			Go to <a href="<c:url value='/list' />">Users List</a>
		</span>
	</div>
</body>

</html>