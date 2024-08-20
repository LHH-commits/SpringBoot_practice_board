<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 조회</title>
</head>
<body>
	<h1>게시물 상세</h1>
	<div>
        <p><strong>제목:</strong> ${board.bTitle}</p>
        <p><strong>작성자:</strong> ${board.bWriter}</p>
        <p><strong>작성일시:</strong> ${board.bDateTime}</p>
        <p><strong>내용:</strong> ${board.bContent}</p>
    </div>
    <form action="/deleteBoard" method="post">
    	<input type="hidden" name="bId" value="${board.bId }">
    	<button type="submit">삭제</button>
    </form>
    <a href="/list">목록으로 돌아가기</a>
</body>
</html>