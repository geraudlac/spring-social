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
		
		<dl>
			<dt>id</dt>
			<dd>${post.id}</dd>
			
			<dt>from</dt>
			<dd>id : ${post.from.id} / name : ${post.from.name}</dd>
			
			<dt>createdTime</dt>
			<dd>${post.createdTime}</dd>
			
			<dt>updatedTime</dt>
			<dd>${post.updatedTime}</dd>
			
			<dt>to</dt>
			<dd><ul>
				<c:forEach items="${post.to}" var="to">
					<li>id : ${to.id} / name : ${to.name}</li>
				</c:forEach>
			</ul></dd>
			
			<dt>message</dt>
			<dd>${post.message}</dd>
			
			<dt>picture</dt>
			<dd>
				${post.picture}
				<c:if test="${! empty post.picture}">
					<br/>
					<img src="${post.picture}" alt="picture posted"  />
				</c:if>
			</dd>
			
			<dt>link</dt>
			<dd>${post.link}</dd>
			
			<dt>name</dt>
			<dd>${post.name}</dd>
			
			<dt>caption</dt>
			<dd>${post.caption}</dd>
			
			<dt>description</dt>
			<dd>${post.description}</dd>
			
			<dt>icon</dt>
			<dd>
				${post.icon}
				<c:if test="${! empty post.icon}">
					<br/>
					<img src="${post.icon}" alt="application icon"  />
				</c:if>
			</dd>
			
			<dt>application</dt>
			<dd>id : ${post.application.id} / name : ${post.application.name}</dd>
			
			<dt>type</dt>
			<dd>${post.type}</dd>
			
			<dt>likes</dt>
			<dd>
				<ul>
					<c:forEach items="${post.likes}" var="like">
						<li>id : ${like.id} / name : ${like.name}</li>
					</c:forEach>
				</ul>
			</dd>
			
			<dt>comments</dt>
			<dd>
				<ul>
					<c:forEach items="${post.comments}" var="comment">
						<li>id : ${comment.id}
							<ul>
								<li>message : ${comment.message}</li>
								<li>createdTime : ${comment.createdTime}</li>
								<li>from : ${comment.from.id} - ${comment.from.name}</li>
								<li>
									likes :
									<ul>
										<c:forEach items="${comment.likes}" var="like">
											<li>id : ${like.id} / name : ${like.name}</li>
										</c:forEach>
									</ul>
								</li>
								<li>likesCount : ${comment.likesCount}</li>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</dd>
			
			<dt>sharesCount</dt>
			<dd>${post.sharesCount}</dd>
			
			<dt>story</dt>
			<dd>${post.story}</dd>
			
			<!-- 	private Map<Integer,List<StoryTag>> storyTags; -->
			<dt>storyTags</dt>
			<dd>${post.storyTags}</dd>
		</dl>
	</body>
</html>
	
	
