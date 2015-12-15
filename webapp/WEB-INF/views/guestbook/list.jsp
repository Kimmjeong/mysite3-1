<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% pageContext.setAttribute( "newLine", "\n" ); %>
<!doctype html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/guestbook.css" type="text/css">
</head>
<body>
	<div id="container">
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
		<div id="content">
			<div id="guestbook">
				<form method="post" action="${pageContext.request.contextPath }/guestbook/insert">
					<table>
						<tr>
							<td>이름</td>
							<td><input type="text" name="name" id="guestbook-name"></td>
							<td>비밀번호</td>
							<td><input type="password" name="password" id="guestbook-password"></td>
						</tr>
						<tr>
							<td colspan=4>
								<textarea name="message" id="guestbook-message"></textarea>
							</td>
						</tr>
						<tr>
							<td colspan=4 align=right>
								<input type="submit" id="btn-add" VALUE=" 확인 ">
							</td>
						</tr>
					</table>
				</form>
				<div id="list">
					<c:forEach items='${list }' var='vo'>			
						<table>
							<tr>
								<td>${vo.name }</td>
								<td>${vo.regDate }</td>
								<td><a href="${pageContext.request.contextPath }/guestbook/deleteform/${vo.no }">삭제</a></td>
							</tr>
							<tr>
								<td colspan=3>
								${fn:replace( vo.message, newLine, '<br>' ) }
								</td>
							</tr>
						</table>
					</c:forEach>
				</div>
				<div id="buttons">
					<button id="btn-next">다음 가져오기</button>
				</div>					
			</div>
		</div>
		<c:import url="/WEB-INF/views/include/navigation.jsp"></c:import>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>