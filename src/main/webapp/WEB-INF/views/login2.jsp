<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Torr | Login</title>

    <!-- Bootstrap -->
    <link href="vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- Animate.css -->
    <link href="https://colorlib.com/polygon/gentelella/css/animate.min.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="login">
    <div>
      <a class="hiddenanchor" id="signup"></a>
      <a class="hiddenanchor" id="signin"></a>

      <div class="login_wrapper">
        <div class="animate form login_form">
          <c:url var="loginUrl" value="/login" />
          <section class="login_content">
            <form action="${loginUrl}" method="post">
              <h1>Login</h1>
              <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                  <p>Invalid username and password.</p>
                </div>
              </c:if>
              <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                  <p>You have been logged out successfully.</p>
                </div>
              </c:if>
              <div>
                <input type="text" class="form-control" placeholder="Username" required="" id="username" name="ssoId" />
              </div>
              <div>
                <input type="password" class="form-control" placeholder="Password" required=""  id="password" name="password"/>
              </div>
              <div class="input-group input-sm">
                              <div class="checkbox">
                                <label><input type="checkbox" id="rememberme" name="remember-me"> Remember Me</label>  
                              </div>
                            </div>
              <input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />
              <div>
                <!--<a class="btn btn-default submit" href="index.html">Log in</a>-->
                <input type="submit" class="btn btn-block btn-primary btn-default" value="Log in">
                <!-- <a class="reset_pass" href="#">Lost your password?</a>-->
              </div>

              <div class="clearfix"></div>

              <div class="separator">
                <p class="change_link">New to site?
                  <a href="#signup" class="to_register"> Create Account </a>
                </p>

                <div class="clearfix"></div>
                <br />

                <div>
                  <h1><i class="fa fa-paw"></i> Torr</h1>
                  <p>©2016 All Rights Reserved. Torr, a Netpace project.</p>
                </div>
              </div>
            </form>
          </section>
        </div>
      </div>
    </div>
  </body>
</html>