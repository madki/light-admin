<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">

	<title><spring:message code="application.name"/></title>

	<link rel="stylesheet" type="text/css" href="<spring:url value="/styles/bootstrap.css"/>" media="screen">
	<link rel="stylesheet" type="text/css" href="<spring:url value="/styles/lightadmin.css"/>" media="screen">


	<script type="text/javascript" src="<spring:url value="/scripts/jquery-1.8.0.min.js"/>"></script>
	<script type="text/javascript" src="<spring:url value="/scripts/bootstrap.min.js"/>"></script>

	<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
	<![endif]-->
</head>

<body class="login">

<div class="container" style="padding-top: 200px;">

	<div class="row">
		<div class="span6 offset3">
			<div id="login">
				<div class="title">
					<img src="<spring:url value='/images/lightning-icone-7684-32.png'/>"/>
					<spring:message code="application.shortname"/>
				</div>
				<c:if test="${not empty param.login_error}">
					<div class="alert alert-block">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<spring:message code="message.security.bad-credentials"/><br/>
						<spring:message code="message.security.reason"/>&nbsp;<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>.
					</div>
				</c:if>
				<form class="form-horizontal" action="<spring:url value='j_spring_security_check'/>" method="POST">
					<fieldset>
						<div class="control-group">
							<label class="control-label" for="j_username"><spring:message code="label.username"/></label>
							<div class="controls">
								<input type="text" id="j_username" name="j_username" placeholder="Please enter your name here" value='<c:if test="${not empty param.login_error}"><c:out value="${SPRING_SECURITY_LAST_USERNAME}"/></c:if>'>
							</div>
						</div>
						<div class="control-group">
							<label class="control-label" for="j_password"><spring:message code="label.password"/></label>
							<div class="controls">
								<input type="password" id="j_password" name="j_password" placeholder="Please enter your password">
							</div>
						</div>
						<div class="control-group">
							<div class="controls">
								<button type="submit" class="btn"><i class="icon-lock"></i>&nbsp;Sign in</button>
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$("#j_username" ).focus();
	});
</script>
</body>
</html>