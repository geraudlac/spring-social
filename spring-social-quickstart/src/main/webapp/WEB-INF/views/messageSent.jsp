<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Back from Facebook "Send Dialog"</title>
	</head>
	<body>
	<ul>
		<li><a href="<c:url value="/" />">Main Menu</a></li>
	</ul>
	
	<h3>Request received from facebook:</h3>
	<ul>
		<li>Request URL  : <c:out value="${requestUrl}"/></li>
		<li>Query String : <c:out value="${queryString}"/></li>
	</ul>	
	</body>
</html>