<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Upload/Download/Delete Documents</title>
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
		<div class="panel panel-default">
			  <!-- Default panel contents -->
		  	<div class="panel-heading"><span class="lead">List of Documents </span></div>
		  	<div class="tablecontainer">
				<table class="table table-hover">
		    		<thead>
			      		<tr>
					        <th>No.</th>
					        <th>File Name</th>
					        <th>Type</th>
					        <th>Description</th>
					        <th width="100"></th>
					        <th width="100"></th>
						</tr>
			    	</thead>
		    		<tbody>
					<c:forEach items="${documents}" var="doc" varStatus="counter">
						<tr>
							<td>${counter.index + 1}</td>
							<td>${doc.name}</td>
							<td>${doc.type}</td>
							<td>${doc.description}</td>
							<td><a href="<c:url value='/download-document-${user.id}-${doc.id}' />" class="btn btn-success custom-width">download</a></td>
							<td><a href="<c:url value='/delete-document-${user.id}-${doc.id}' />" class="btn btn-danger custom-width">delete</a></td>
						</tr>
					</c:forEach>
		    		</tbody>
		    	</table>
		    </div>
		</div>
		<div class="panel panel-default">
			
			<div class="panel-heading"><span class="lead">Upload New Document</span></div>
			<div class="uploadcontainer">
				<form:form method="POST" modelAttribute="fileBucket" enctype="multipart/form-data" class="form-horizontal">
			
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Upload a document</label>
							<div class="col-md-7">
								<form:input type="file" path="file" id="file" class="form-control input-sm"/>
								<div class="has-error">
									<form:errors path="file" class="help-inline"/>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="form-group col-md-12">
							<label class="col-md-3 control-lable" for="file">Description</label>
							<div class="col-md-7">
								<form:input type="text" path="description" id="description" class="form-control input-sm"/>
							</div>
							
						</div>
					</div>
			
					<div class="row">
						<div class="form-actions floatRight">
							<input type="submit" value="Upload" class="btn btn-primary btn-sm">
						</div>
					</div>
	
				</form:form>
				</div>
		</div>
	 	<div class="well">
	 		Go to <a href="<c:url value='/list' />">Users List</a>
	 	</div>
   	</div>
</body>
</html>