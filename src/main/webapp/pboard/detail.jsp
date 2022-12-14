<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.4.2/css/all.css'>
<link rel="stylesheet" href="pboarddist/pboard_style.css">
<style type="text/css">
#comments {
	margin-top: 32px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let i=0;
let u=0;
$(function(){
	$('#del').click(function(){
		if(i==0)
		{
			$('#delTr').show("slow");
			$('#del').text("취소")
			i=1;
		}
		else
		{
			$('#delTr').hide();
			$('#del').text("삭제")
			i=0;
		}
	})
	
	$('#delBtn').on("click",function(){
		let pwd=$('#delPwd').val();
		let p_no=$(this).attr("data-p_no");
		alert(p_no)
		if(pwd.trim()=="")
		{
			$("#delPwd").focus();
			return;
		}
		$.ajax({
			type:'post',
			url:'../pboard/delete.do',
			data:{"p_no":p_no,"pwd":pwd},
			success:function(result)
			{
				let res=result.trim();
				if(res=="yes")// 정상 수행 (비밀번호가 같다)
				{
					location.href="../pboard/list.do"; // sendRedirect()
				}
				else
				{
					alert("비밀번호가 틀립니다!")
					$('#delPwd').val("");
					$('#delPwd').focus();
				}
			},
			error:function(request, status, error)
			{
				alert(error);
			}
			
		})
	})

$('.up').click(function(){
		$('.updates').hide();
	
		let p_no=$(this).attr("data-p_no");
		/* alert(p_no) */
		
		if(u==0)
		{
			$('#update'+p_no).show();
			$(this).text("취소")
			u=1;
		}
		else
		{
            $('#update'+p_no).hide();
            $(this).text("수정");
            u=0;
		}
	})
	$('.uBtn').click(function(){
		let data_p_no=$(this).attr("data-p_no");
		let p_no=$('#update_p_no'+data_p_no).val();
		/* let pre_no=$('#update_pre_no'+data_p_no).val(); */
		let msg=$('#update_msg'+data_p_no).val();
		if(msg.trim()=="")
		{
			$('#update_msg'+data_p_no).focus();
			return;
		}
		 $.ajax({
			type:'post',
			url:'preply_update.do',
			data:{"p_no":p_no,"pre_no":pre_no,"msg":msg},
			success:function(result)
			{
				$('#reply_data').html(result);
			}
		})
	})
})
</script>
</head>
<body>
	<div class="wrapper row3">
		<div id="breadcrumb" class="clear">

			<ul>
				<li><a href="../main/main.do">Home</a></li>
				<li><a href="../pboard/list.do">커뮤니티</a></li>
				<li><a href="../pboard/detail.do?p_no=${vo.p_no }">상세보기</a></li>
			</ul>

		</div>
	</div>

	<div class="wrapper row3">
		<main class="container clear">
			<!-- main body -->
			<h2 class="sectiontitle">내용보기</h2>
			<div class="two_third first">
				<table class="table">
					<tr>
						<th width=20% class="text-center">번호</th>
						<td width=30% class="text-center">${vo.p_no }</td>
						<th width=20% class="text-center">작성일</th>
						<td width=30% class="text-center">${vo.dbday }</td>
					</tr>
					<tr>
						<th width=20% class="text-center">작성자</th>
						<td width=30% class="text-center">${vo.id }</td>
						<th width=20% class="text-center">조회수</th>
						<td width=30% class="text-center">${vo.hit }</td>
					</tr>
					<tr>
						<th width=20% class="text-center">제목</th>
						<td colspan="3">${vo.subject }</td>
					</tr>
					<tr>
						<td colspan="4" height="200" valign="top" class="text-left">
							<pre
								style="white-space: pre-wrap; background-color: white; border: none">${vo.content }</pre>
						</td>
					</tr>
					<tr>
						<td colspan="4" class="text-right" style="text-align: right;">
							<a href="../pboard/update.do?p_no=${vo.p_no }"
							class="btn btn-xs btn-danger">수정</a> <span
							class="btn btn-xs btn-info" id="del">삭제</span> <a
							href="../pboard/list.do" class="btn btn-xs btn-warning">목록</a>
						</td>
					</tr>
					<tr id="delTr" style="display: none">
						<td colspan="4" class="text-right inline"><span>비밀번호 :
								&nbsp; </span><input type=password name=pwd size=10 class="input-sm"
							id="delPwd"> <input type=button value="삭제"
							class="btn btn-sm btn-danger" id="delBtn" data-p_no="${vo.p_no }">
						</td>
					</tr>
				</table>


				<div id="article-neighbor-list">
					<!-- 이동은 가능한데 제목이랑 삭제된 게시글에 대한 오류해결 해야함 !! -->
					<div>
						<span class="indicator"><strong>▲윗글</strong></span> <a
							href="../pboard/detail.do?p_no=${(vo.p_no)+1 }" class="subject">${vo.subject }</a>
					</div>
					<div>
						<span class="indicator"><strong>▼아랫글</strong></span> <a
							href="../pboard/detail.do?p_no=${(vo.p_no)-1}" class="subject">${vo.subject }</a>
					</div>
				</div>

				<div style="height: 30px"></div>
				<div class="row" id="reply_data">
					<!-- ajax 실행 (수정된 데이터 ) -->
				</div>
			</div>

			<div id="comments">
				<h2>댓글</h2>
				<ul>
					<c:forEach var="rvo" items="${list }">
						<li>

							<article>
								<header style="display: -webkit-inline-box;">

									<address>
										<a>${rvo.id }&nbsp;(${rvo.dbday })&nbsp;&nbsp;&nbsp;</a>
									</address>
									<figure class="avatar">
										<c:if test="${sessionScope.id!=null }">
											<c:if test="${sessionScope.id==rvo.id}">
												<!-- 본인이면 -->
												<span class="btn btn-xs btn-danger up" style="color: black"
													data-p_no="${rvo.pre_no }">수정</span>
												<a
													href="../preply/preply_delete.do?pre_no=${rvo.pre_no }&p_no=${vo.p_no}"
													class="btn btn-xs btn-success" style="color: black">삭제</a>
											</c:if>
										</c:if>
									</figure>
								</header>
								<div class="comcont">
									<p>
									<pre
										style="white-space: pre-wrap; background-color: white; border: none">${rvo.msg }</pre>
									</p>
								</div>
							</article>

						</li>
						<div style="display: none" id="update${rvo.pre_no }"
							class="updates">
							<table class="table">
								<tr>
									<td>
										<form method=post action="../preply/preply_update.do">
											<input type=hidden name=p_no value="${vo.p_no }"> 
											<input
													type=hidden name=pre_no value="${rvo.pre_no }"> 
												<input
													type=hidden name=type value="1">
											<textarea rows="5" cols="70" name="msg" style="float: left">${rvo.msg }</textarea>
											<input type=submit class="btn btn-sm btn-primary uBtn"
												style="height: 105px" data-p_no="${rvo.p_no }" value="댓글수정">
										</form>
									</td>
								</tr>
							</table>
						</div>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${sessionScope.id!=null }">
				<!-- 로그인시에만 보여준다 -->
				<table class="table">
					<tr>
						<td>
							<form method=post action="../preply/preply_insert.do">
								<input type=hidden name=p_no value="${vo.p_no }"> <input
									type=hidden name=type value="1">
								<textarea rows="5" cols="100" name="msg" style="float: left"></textarea>
								<input type=submit class="btn btn-sm btn-primary"
									style="height: 105px" value="댓글쓰기">
							</form>
						</td>
					</tr>
				</table>
			</c:if>
		</div>

	</main>
	</div>
</body>
</html>