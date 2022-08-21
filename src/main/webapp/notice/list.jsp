<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Tour Bus</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<!--  <link rel="stylesheet" type="text/css" href="https://d4fodtu7cqfym.cloudfront.net/fad0d3bf8c478ce27ec4b20657d43000.min.css?v=200103-10"> -->
<link rel="stylesheet" href="../pboard/pboarddist/pboard_style.css">
<style type="text/css">
.pagination {
    margin: 20px 0;
    overflow: hidden;
    position: relative;
}
.pagination li {
    float: left;
}
.pagination ul {
    float: left;
    left: 50%;
    position: relative;
}
.pagination ul > li {
    left: -50%;
    position: relative;
}
.pagination li a {
    transition: all 100ms ease-in-out 0s;
    background-color: #FFFFFF;
    border-radius: 5px 5px 5px 5px;
    color: #69696E;
    display: block;
    font: 16px/30px Noto Sans KR, sans-serif;
    height: 30px;
    margin: 0 3px;
    overflow: hidden;
    position: relative;
    text-align: center;
    text-decoration: none;
    width: 30px;
}
.pagination li a:hover {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a {
    background-color: #F34100;
    color: #FFFFFF;
}
.pagination li.active a:hover {
    color: #F34100;
}

</style>

</head>
<body>
<!-- partial:index.partial.html -->
<div class='app'>
  <div class='pheader'>
    
  </div>
  <div class='pbody'>
    <div class='psidebar'>
      <ul class="psidebar-nav inline">
        <li>
          <button>
           <h2>커뮤니티</h2>
          <!--   <i class='fas fa-home'></i> -->
          </button>
        </li>
        <li>
          <button type="button" onclick= "location.href='../pboard/list.do'">
	          <span>자유게시판 </span>
	           <i class='fas fa-book'></i>
          </button>
        </li>
        <li>
          <button type="button" onclick= "location.href='../ppboard/list.do'">
            <span>반려동물 자랑 게시판 </span>
            <i class='fas fa-car'></i>
          </button>
        </li>
        <li>
          <button type="button" onclick= "location.href='../qna/list.do'">
            <span>문의 게시판</span>
            <i class='fas fa-cloud'></i>
          </button>
        </li>
         <li>
          <button type="button" onclick= "location.href='../notice/list.do'">
            <span>공지사항</span>
            <i class='fas fa-cloud'></i>
          </button>
        </li>
      </ul>
    </div>
			<div class='main'>
				<div class='main__content'>
					<div class='ptable-card'>
						<h2>Notice</h2>
						<c:if test="${sessionScope.admin=='y'}">
							<!-- 로그인한 사람만 보임  -->
							<a href="../notice/insert.do"
								class="btn square btn-primary write" id="WriteBtn"> <i
								class="fa fa-pencil"></i> 글 쓰기
							</a>
						</c:if>
						<table class='ptable'>
							<thead>
								<tr>
									<td width="10%" class="text-center">번호</td>
									<td width="45%" class="text-center">제목</td>
									<td width="15%" class="text-center">작성자</td>
									<td width="20%" class="text-center">작성일</td>
									<td width="10%" class="text-center">조회수</td>
								</tr>
							</thead>
<!-- 글 리스트 -->
							<c:forEach var="vo" items="${list }">
								<tr>
									<td width="10%" class="text-center">${vo.n_no }</td>
									<td width="45%"><a
										href="../notice/detail.do?n_no=${vo.n_no }">${vo.subject }</a>
									<td width="15%" class="text-center">${vo.id }</td>
									<td width="20%" class="text-center">${vo.dbday }</td>
									<td width="10%" class="text-center">${vo.hit }</td>

								</tr>
							</c:forEach>

						</table>
					</div>
<!-- 페이징  -->					
					<div class="container" align="center">
						<div class="pagination" style="width:200px; margin-top: 35px;">
							<ul>
								<c:if test="${startPage>1 }">
									<li><a href="../notice/list.do?page=${startPage-1 }">&laquo;</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:if test="${i==curpage }">
										<li class="active"><a href="../notice/list.do?page=${i }">${i }</a></li>
									</c:if>
									<c:if test="${i!=curpage }">
										<li><a href="../notice/list.do?page=${i }">${i }</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${endPage<totalpage }">
									<li><a href="../notice/list.do?page=${endPage+1 }">&raquo;</a></li>
								</c:if>
							</ul>
						</div>
					</div>
				</div>
					
		
<!-- partial -->
  <script  src="../pboard/pboarddist/pboard_script.js"></script>
</body>
</html>