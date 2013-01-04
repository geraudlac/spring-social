<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Back from Facebook Dialog</title>
	</head>
	<body>
		<ul>
			<li><a href="<c:url value="/" />">Main Menu</a></li>
		</ul>
		
		<div>Coming back from Facebook <b>${dialogType}</b> dialog</div>
		
		<h3>Request received from facebook:</h3>
		<ul>
			<li>Request URL  : <c:out value="${requestUrl}"/></li>
			<li>Query String : <c:out value="${queryString}"/></li>
		</ul>
		
		<c:if test="${post_id != null}">
			<a href="<c:url value='/getPost/${post_id}' />">view this new post</a>
		</c:if>	
	</body>
</html>