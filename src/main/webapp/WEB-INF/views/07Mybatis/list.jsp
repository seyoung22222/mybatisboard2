<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container">
	<h3 class="text-center">방명록(한줄게시판)</h3>
	<!-- 로그인/로그아웃 및 글쓰기 버튼 -->
	<div class="text-right">
			<!-- 세션영역에 해당 속성이 있다면, 로그인 상태이므로 '로그아웃'
			버튼을 출력한다.  -->
		<c:choose>
			<c:when test="${not empty sessionScope.siteUserInfo }">
				<button class="btn btn-danger"
					onclick="location.href='logout.do';">
					로그아웃
				</button>
			</c:when>
			<c:otherwise>
				<!-- 로그아웃 상태일때는 '로그인'버튼을 출력한다. -->
				<button class="btn btn-info"
					onclick="location.href='login.do';">
					로그인
				</button>
			</c:otherwise>
		</c:choose>
		&nbsp;&nbsp;
		<button class="btn btn-success"
			onclick="location.href='write.do';">
			방명록 쓰기
		</button>
	</div>
	
	<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row">		
		<div class="border mt-2 mb-2">
			<div class="media">
				<div class="media-left mr-3">
					<img src="../images/img_avatar3.png" class="media-object" style="width:60px">
				</div>
				<div class="media-body">
					<h4 class="media-heading">작성자:${row.name }(${row.id })</h4>
					<p>${row.contents }</p>
				</div>	  
				<!--  수정,삭제버튼 -->
				<div class="media-right">
					<!-- 수정/삭제 버튼을 작성자 본인에게만 보여야 하므로 세션영역에 저장된
					아이디와 게시물을 작성한 아이디가 같을때만 버튼을 출력한다 
					※EL에서는 영역을 지정하는 내장객체를 생략할 수 있다. 따라서 sessionScope
					는 삭제해도 무방하다. -->
					<c:if test="${sessionScope.siteUserInfo.id eq row.id }">
						<button class="btn btn-primary"
							onclick="location.href='modify.do?idx=${row.idx}';">
							수정
						</button>
						<button class="btn btn-danger"
							onclick="javascript:deleteRow(${row.idx});">
							삭제
						</button>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
</div>

</body>
</html>