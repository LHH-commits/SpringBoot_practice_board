<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h1 {
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        .button {
            padding: 10px 15px;
            text-decoration: none;
            color: #fff;
            background-color: #007bff;
            border-radius: 5px;
            font-size: 16px;
            display: inline-block;
            margin-bottom: 20px;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .header {
	        display: flex;
	        justify-content: space-between;
	        align-items: center;
	        margin-bottom: 20px;
   		}
    	.logout-button {
	        padding: 10px 15px;
	        text-decoration: none;
	        color: #fff;
	        background-color: #dc3545;
	        border-radius: 5px;
	        font-size: 16px;
   		}
    	.logout-button:hover {
        	background-color: #c82333;
   		}
   		.pagination {
	        text-align: center;
	        margin: 20px 0;
	    }
	    .pagination a {
	        color: #007bff;
	        text-decoration: none;
	        padding: 10px 15px;
	        border: 1px solid #ddd;
	        border-radius: 5px;
	        margin: 0 5px;
	    }
	    .pagination a:hover, .pagination a.active {
	        background-color: #007bff;
	        color: #fff;
	        border-color: #007bff;
	    }
	    .pagination .disabled {
	        color: #ddd;
	        border-color: #ddd;
	        cursor: not-allowed;
	    }
    </style>
    <script>
        function goToList() {
            window.location.href = "/list"; // 전체 리스트로 이동
        }
    </script>
</head>
<body>
    <div class="container">
    	<div class="header">
    		<h1>
    			<span onclick="goToList()" style="cursor: pointer;">게시물 목록</span>
    		</h1>
    		<a href="/logout" class="logout-button">로그아웃</a>	
    	</div>
		<form action="/list" method="get">
		    <select name="searchOption">
		        <option value="title" ${searchparam.searchOption == 'title' ? 'selected' : ''}>제목으로 검색</option>
		        <option value="content" ${searchparam.searchOption == 'content' ? 'selected' : ''}>내용으로 검색</option>
		        <option value="titleContent" ${searchparam.searchOption == 'titleContent' ? 'selected' : ''}>제목+내용으로 검색</option>
		    </select>
		    <input type="text" name="searchKeyword" value="${searchparam.searchKeyword != null ? searchparam.searchKeyword : ''}" placeholder="검색어 입력">
		    <button type="submit">검색</button>
		</form>
        <table>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일시</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${list}">
                    <tr>
                        <td>${item.bId}</td>
                        <td><a href="/detailBoard?bId=${item.bId}&page=${pagination.page}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">${item.bTitle}</a></td>
                        <td>${item.bWriter}</td>
                        <td>${item.bDateTime}</td>
                        <td>${item.bViews}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
		<div class="pagination">
		    <c:if test="${pagination.prevPage > 0}">
		        <a href="/list?page=${pagination.prevPage}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">이전</a>
		    </c:if>
		    <c:forEach var="i" begin="${pagination.startPage}" end="${pagination.endPage}">
		        <a href="/list?page=${i}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}"
		        	class="${i == pagination.page ? 'active' : ''}">${i}</a>
		    </c:forEach>
		    <c:if test="${pagination.nextPage <= pagination.lastPage}">
		        <a href="/list?page=${pagination.nextPage}&searchOption=${searchparam.searchOption}&searchKeyword=${searchparam.searchKeyword}">다음</a>
		    </c:if>
		</div>
        <a href="/insertBoard" class="button">새 게시물 작성하기</a>
    </div>
</body>
</html>