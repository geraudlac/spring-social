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
		<li>
			<form name="openDialogForm" action="openDialog" method="post">
				<select name="dialogType">
					<option value="send" selected="selected">Send Dialog</option>
					<option value="feed">Feed Dialog</option>
				</select>
				<select name="display">
					<option value="page" selected="selected">page</option>
					<option value="popup">popup</option>
					<option value="iframe">iframe</option>
					<option value="touch">touch</option>
 				</select>
 				<input type="submit" value="Open dialog" />
			</form>
		</li>
		<li><a href="<c:url value="/postOnWall" />">Post a link to Herd Wisdom on my wall</a></li>
		<li><a href="<c:url value="/messages" />">Get all your messages</a></li>
	</ul>	
	</body>
</html>