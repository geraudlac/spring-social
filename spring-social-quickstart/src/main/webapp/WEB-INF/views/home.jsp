<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Home</title>
	</head>
	<body>
	<ul>
		<li><a href="<c:url value="/signout" />">Sign Out</a></li>
	</ul>
	<h3>Main menu</h3>
	<ul>
		<li><a href="<c:url value="/viewFriends" />">Display your friends</a></li>
		<li><a href="<c:url value="/sendMessage" />">Send a message</a></li>
		<li><a href="<c:url value="/postOnWall" />">Post a link to Herd Wisdom on my wall</a></li>
		<li><a href="<c:url value="/messages" />">Get all your messages</a></li>
	</ul>	
	</body>
</html>