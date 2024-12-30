<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<style>
	.table-rounded {
		border-radius:0.5rem;
		overflow: hidden;	
	}
</style>
</head>
<body>
	<div class="container-md mt-4" style="max-width:900px">
		<div class="d-flex justify-content-between align-items-center mb-4">
			<h3>게시물 작성</h3>
		</div>
		<!-- 현재 로그인한 사용자의 이름(작성자)을 가져오기 -->
		<sec:authentication property="principal" var="principal"/>
		<c:set var="uName" value="${principal.uName}"/>
		
		<form action="/insertBoard" method="post">
		<input type="hidden" name="bWriter" value="${uName }">
		<input type="hidden" name="username" value="${username }">
        <table class="table table-rounded">
            <tr>
                <td class="fw-bold bg-info-subtle align-middle text-center"><label for="bTitle" class="form-label form-info">제목</label></td>
                <td class="bg-light"><input type="text" class="form-control" id="bTitle" name="bTitle" required></td>
            </tr>
            <tr>
                <td class="fw-bold bg-info-subtle align-middle text-center">
                <label for="bContent" class="form-label">내용</label></td>
                <td class="bg-light">
                	<textarea class="form-control" id="bContent" name="bContent" 
                          style="height: 150px; white-space: pre-line;" 
                          required>${board.bContent}</textarea>
                </td>
            </tr>
        </table>
	        <button type="submit" class="btn btn-primary btn-md">게시물 작성</button>
	        <a href="/list" class="btn btn-outline-primary btn-md">뒤로</a>
	    </form>
    </div>
</body>
</html>