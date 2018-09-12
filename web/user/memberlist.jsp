<%@ page import="com.user.userDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@include file="../WEB-INF/modules/location.jsp"%>
<c:if test="${empty sessionScope.userID}">
	<c:redirect url = "../login/login.jsp" />
</c:if>
<c:if test="${sessionScope.userLevel ne 1}">
	<c:redirect url = "../warning.html"/>
</c:if>
<jsp:useBean id="userDTO" scope="request" class="com.user.userDTO"></jsp:useBean>
<jsp:useBean id="userDAO" class="com.user.userDAO"></jsp:useBean>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>비트캠프 자바기반 웹&앱 개발자 양성과정 프로젝트</title>
	<link href="../assets/css/plugins/plugins.css" rel="stylesheet">
	<link href="../assets/plugins/ytplayer/jquery.mb.YTPlayer.min.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/dzsparallaxer.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/scroller.css" rel="stylesheet">
	<link href="../assets/plugins/dzsparallaxer/advancedscroller/plugin.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../assets/plugins/cubeportfolio/css/cubeportfolio.min.css">
	<link href="../assets/css/style.css" rel="stylesheet">
	<%--제이쿼리--%>
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<script src="member_modify.js"></script>
	<link rel="stylesheet" type="text/css" href="memberlist.css">
</head>
<body>
<%--메뉴--%>
<%@include file="../WEB-INF/modules/navbar/loginNav.jsp"%>
<%--메뉴--%>
<!--page title-->
<div class="cta-bg-slider bg-primary auto-init height-is-based-on-content" data-options='{   direction: "reverse"}'>
	<div class="container pt100 pb100">
		<div class="row">
			<div class="col-md-8 ml-auto mr-auto wow bounceIn" data-wow-delay=".2s">
				<h3 class="h3 mb30 text-center font300 text-white">회원관리</h3>
			</div>
		</div>
	</div>
</div>
<!--parallax-->
<!--/.page-title-->
<div class="container pt90 pb60">
	<table id="memberlist" class="table">
		<thead>
		<tr>
			<th>#</th>
			<th>아이디(이메일)</th>
			<th>이름</th>
			<th>닉네임</th>
			<th>회원등급</th>
			<th>비밀번호</th>
			<th>관리</th>
		</tr>
		</thead>
		<tbody>
		<%
			ArrayList<userDTO> list = userDAO.getMemberAll();
			int index = 1;
			String passwordLength = "";
			for (userDTO dto : list) {
		%>
		<tr>
			<% for (int i=0;i<dto.getUserPwd().length();i++) passwordLength += "*";%>
			<td class="userNo"> <%= index++ %> </td>
			<td class="userID"><%= dto.getUserID() %></td>
			<td class="userName"><%= dto.getUserName()%></td>
			<td class="userNickName"><%= dto.getUserNickName()%></td>
			<td class="userLevel">
				<% switch (dto.getUserLevel()){
					case "1": %>관리자<%break;
					case "10": %>일반회원<%break;
				}%>
			</td>
			<td class="userPwd"><%= passwordLength %></td>
			<% passwordLength=""; %>
			<td class="userModify">
				<button type="button" onclick="admin_modify_member('<%=dto.getUserID()%>')" class="btn btn-sm btn-outline-dark" data-toggle="modal" data-target="#exampleModal">수정</button>
				<button type="button" onclick="admin_delete_member('<%=dto.getUserID()%>')" class="btn btn-sm btn-outline-danger">삭제</button>
			</td>
		</tr>
		<%
			}
		%>
		</tbody>
	</table>
</div>
<%--내용--%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">회원정보수정</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" style="padding-bottom: 0px;">
				<form class="p-1" method="post" action="save.jsp">
					<div class="input-group mb-3">
						<div class="input-group-addon" style="width: 35px; border-radius: 10px 0px 0px 10px;">
							<i class="fa fa-at"></i>
						</div>
						<input name="userIDModal" class="form-control" id="userIDModal" aria-describedby="basic-addon2" required="" type="email" maxlength="20" placeholder="수정할 아이디(이메일)를 입력해주세요." readonly autocomplete="off">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-addon" style="width: 35px; border-radius: 10px 0px 0px 10px;">
							<i class="fa fa-user"></i>
						</div>
						<input name="userNameModal" class="form-control" id="userNameModal" aria-describedby="basic-addon2" required="" type="text" maxlength="20" placeholder="수정할 이름을 입력해주세요." readonly autocomplete="off">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-addon" style="width: 35px; border-radius: 10px 0px 0px 10px;">
							<i class="fa fa-user-md"></i>
						</div>
						<input name="userNickNameModal" class="form-control" id="userNickNameModal" aria-describedby="basic-addon2" required="" type="text" maxlength="20" placeholder="수정할 닉네임을 입력해주세요." autocomplete="off">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-addon" style="width: 35px; border-radius: 10px 0px 0px 10px;">
							<i class="fa fa-lock"></i>
						</div>
						<input name="userPwdModal" class="form-control" id="userPwdModal" aria-describedby="basic-addon2" required="" type="password" maxlength="20" placeholder="수정할 비밀번호를 입력해주세요." autocomplete="off">
					</div>
					<div class="input-group mb-3">
						<div class="input-group-addon" style="width: 35px; border-radius: 10px 0px 0px 10px;">
							<i class="fa fa-lock"></i>
						</div>
						<select id="userLevelModal" name="userLevelModal" class="custom-select mb-2 mr-sm-2 mb-sm-0" style="width: 100%; border-radius: 0px 10px 10px 0px; margin: 0px!important;">
							<%--<option selected>회원등급변경</option>--%>
							<option value="1">관리자</option>
							<option value="10">일반회원</option>
						</select>
					</div>
					<div class="modal-footer" style="padding-bottom: 0px">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						<button type="button" class="btn btn-primary" onclick="admin_modify_submit()">수정</button>
					</div>
				</form>
			</div>
			<%--<div class="modal-footer">--%>
				<%--<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>--%>
				<%--<button type="button" class="btn btn-primary">Save changes</button>--%>
			<%--</div>--%>
		</div>
	</div>
</div>
<!--modal-->

<%--footer--%>
<%@include file="../footer.jsp" %>
<%--footer--%>

<%--오류메시지--%>
<%@include file="../WEB-INF/modules/logError.jsp" %>
<%--오류메시지--%>
<script src="../assets/js/bundle/bundle.js" type="text/javascript"></script>
<!--dz parallaxer-->
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/dzsparallaxer.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/scroller.js"></script>
<script type="text/javascript" src="../assets/plugins/dzsparallaxer/advancedscroller/plugin.js"></script>
<script src="../assets/js/versa.custom.js"></script>
</body>
</html>
