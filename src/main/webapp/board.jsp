<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>드립프트 Dripft - 게시판</title>
<style type="text/css">
table {
	text-align: center;
}
td {
}
</style>
<link rel="shortcut icon" type="image/x-icon" href="./img/favicon.ico" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script type="text/javascript" src="./js/common/jquery.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
	
<!-- font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Nanum+Brush+Script&display=swap" rel="stylesheet">
</head>
<body>
	<%@include file="./nav_main.jsp" %>	
	<table id="list" style="width: 100%;" class="table table-primary table-hover"
				style="font-size: 12px; text-align: center; vertical-align: middle;">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일자</th>
			<th>추천</th>
			<th>비추</th>
			<th>조회수</th>
			<th>닉네임</th>
			<th>댓글수</th>			
		</tr>
		<c:forEach items="${list }" var="i">
			<tr>
				<td>${i.b_no }</td>
				<td><a href="./boardDetail?b_no=${i.b_no }">${i.b_title }</a></td>
				<td>${i.b_date }</td>
				<td>${i.b_like }</td>
				<td>${i.b_dislike }</td>
				<td>${i.b_viewcount }</td>
				<td>${i.m_nickname }</td>
				<td>${i.totalcomments }</td>
			</tr>
		</c:forEach>
	</table>
	<a href="./boardWrite?write=0"><button style="width: 10%; margin-left: 83%;">글쓰기</button></a>
	<div style="text-align: center;">
	<hr>
	<%-- pageNo = ${pageNo } <br> totalcount = ${totalcount }<br> --%>
	<!-- totalpage = --> <fmt:parseNumber integerOnly="true" var="totalpage"	value="${totalcount / 10 }" />
			<c:if test="${(totalcount % 10) > 0 }">
				<c:set var="totalpage" value="${totalpage + 1}" />
			</c:if>
	<%-- 변환된 : ${totalpage } <br> --%>
	<hr>
	<!-- 페이지 시작,끝 번호 버튼 선언 -->
	<c:if test="${pageNo % 10 ne 0 }">
		<fmt:parseNumber integerOnly="true" var="startpage" value="${pageNo / 10 }"/>
		<c:set var="startpage" value="${startpage * 10 + 1 }" />
	</c:if>
	<c:if test="${pageNo % 10 eq 0 }">
		<c:set var="startpage" value="${pageNo - 9 }" />
	</c:if>
	<%-- startpage : ${startpage } <br> --%>
	<c:set var="endpage" value="${startpage + 9 }" />
	<c:if test="${startpage + 10 gt totalpage }">
		<c:set var="endpage" value="${totalpage }" />
	</c:if>
	<%-- endpage : ${endpage } --%>
	<hr>
	
	<c:choose>
		<c:when test="${pageNo ne 1 }">
			<button onclick="location.href='./boardlist?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./boardlist?pageNo=${pageNo - 1}'">1칸 왼쪽으로</button>
		</c:otherwise>
	</c:choose>
	
	<!-- 페이지 href 생성 -->
	<c:forEach begin="${startpage }" end="${endpage }" var="n">
		<a href="./boardlist?pageNo=${n }">${n }</a>
	</c:forEach>
	<c:choose>
		<c:when test="${pageNo ne totalpage }">
			<button onclick="location.href='./boardlist?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:when>	
		<c:otherwise>
			<button disabled="disabled" onclick="location.href='./boardlist?pageNo=${pageNo + 1}'">1칸 오른쪽으로</button>
		</c:otherwise>
	</c:choose>
</div>

</body>
</html>