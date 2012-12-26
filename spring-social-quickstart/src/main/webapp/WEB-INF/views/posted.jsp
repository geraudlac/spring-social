<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Link posted on my wall!</title>
	</head>
	<body>
		<ul>
			<li><a href="<c:url value="/" />">Main Menu</a></li>
		</ul>
		
		<h3>post id: <c:out value="${postId}"/></h3>
	</body>
</html>