<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<title>Sign In</title>
	</head>
	<body>
		<form action="<c:url value="/signin/facebook" />" method="POST">
		    <button type="submit">Sign in with Facebook</button>
		    <input type="hidden" name="scope" value="email,publish_stream,read_stream,offline_access,read_mailbox" />
			<!--
				- publish_stream to be able to post on the wall via the API
				- read_stream to be able to get a post (e.g. a link posted through the Facebook feed dialog
			-->
		</form>
	</body>
</html>
