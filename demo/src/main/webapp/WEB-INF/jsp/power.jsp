<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=Edge">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	<title> 기기별 월 전력량 </title>
</head>

<body>

<div class="container">
	<div id="sidebar" class="sidebar">
		<div id='divSidebar' class="fixedArea">
			<li id="product"><a type='button' href="${wasPath}/product"> 기기등록 </a></li>							
			<li id="usage">  <a type='button' href="${wasPath}/usage"> 사용량 등록 </a></li>
			<li id="chart">  <a type='button' href="${wasPath}/chart"> 사용량 차트 </a></li>
		</div>
	</div>
    <table class="table table-hover table table-striped">
        <tr>
            <th>번호</th>
            <th>작성자</th>
            <th>제목</th>
        </tr>

        <c:forEach items="${list}" var="post">
            <tr>
                <th>1111</th>
                <th>22222</th>
                <th>33333</th>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>