<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Messages</title>
	</head>
	<body>
	<ul>
		<li><a href="<c:url value="/signout" />">Sign Out</a></li>
		<li><a href="<c:url value="/" />">Main Menu</a></li>
	</ul>
	
<%-- 	<c:if test="${empty message}"><c:set var="messageCount" value="0" scope="page" /></c:if> --%>
<%-- 	<c:if test="${!empty message}"><c:set var="messageCount" value="${messages.size()}" scope="page" /></c:if> --%>
	
	<h3>Your Facebook <c:out value="${postCount}" /> Posts</h3>
<!-- 	<ul> -->
<%-- 	<c:forEach items="${friends}" var="friend"> --%>
<%-- 		<li><img src="http://graph.facebook.com/<c:out value="${friend.id}"/>/picture" align="middle"/><c:out value="${friend.name}"/></li> --%>
<%-- 	</c:forEach> --%>
<!-- 	</ul>	 -->
	
	<h3>Your Facebook Inbox:</h3>
	<div>${inbox}</div>
	
	<h3>The message thread from Geraud to Sebastien:</h3>
	<div>${messageThreadToSeb}</div>
	
	<h3>The 3rd message from Geraud to Sebastien:</h3>
	<div>${message3ToSeb}</div>
	
	</body>
</html>