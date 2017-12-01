<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="friendlist" class="at_box at_half">
	<div class="at_header">친구목록</div>
	<div class="mt_table">
		<div class="mt_body">
			<div class="mt_row">
				<div class="mt_cell mt_field">이름</div>
				<div class="mt_cell mt_field">등록일자</div>
				<div class="mt_cell"></div>
			</div>
			<c:forEach var="friend" items="${friendlist}" >
				<div class="mt_row">
					<div class="mt_cell">ㅇㅇ</div>
					<div class="mt_cell">${friend.friendDate}</div>
					<div class="mt_cell bt_no delete"
					onclick="deletefriend(${friend.friendNo})">삭제</div>
				</div>
			</c:forEach>
			<c:if test="${empty friendlist}">
				<div class="mt_row ft_large">
					<div class="mt_cell">
						<img src="/seok/images/myPage/nofriend.png"/><br>
						친구가 없습니다
					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>

<div id="friendrequestlist" class="at_box at_quarter">
	<div class="at_header">보낸요청</div>
	<div class="mt_table">
		<div class="mt_body">
		<div class="mt_row">
				<div class="mt_cell mt_field">이름</div>
				<div class="mt_cell mt_field">등록일자</div>
		</div>
			<c:forEach var="friendrequest" items="${friendrequestlist}">
				<div class="mt_row">
					<div class="mt_cell">ㅇㅇ</div>
					<div class="mt_cell">${friendrequest.friendDate}</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<div id="friendresponselist" class="at_box at_quarter">
	<div class="at_header">받은요청</div>
	<div class="mt_table">
		<div class="mt_body">
		<div class="mt_row">
				<div class="mt_cell mt_field">이름</div>
				<div class="mt_cell mt_field">등록일자</div>
				<div class="mt_cell"></div>
				<div class="mt_cell"></div>
		</div>
			<c:forEach var="friendresponse" items="${friendresponselist}">
				<div class="mt_row">
					<div class="mt_cell">ㅇㅇ</div>
					<div class="mt_cell">ㅇㅇ</div>
					<div class="mt_cell bt_yes accept"
					onclick="acceptfriend(${friendresponse.friendNo})">수락</div>
					<div class="mt_cell bt_no deny"
					onclick="deletefriend(${friendresponse.friendNo})">거절</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>

<script>
	var requestfriend = function(friendNo){
		$.ajax({
			url: "/seok/member/friendrequest.do",
			data:
				"memberno=${user.memberNo}"
				+"&friendNo="+friendNo,
			success: function () {}
		});
	}

	var acceptfriend = function(friendNo){
		console.log(friendNo);
// 		$.ajax({
// 			url: "/seok/member/friendaccept.do",
// 			data:
// 				"memberno=${user.memberNo}"
// 				+"&friendNo="+friendNo,
// 			success: function () {}
// 		});
	}

	var deletefriend = function(friendNo){
		$.ajax({
			url: "/seok/member/frienddelete.do",
			data:
				"memberNo=${user.memberNo}"
				+"&friendNo="+friendNo,
			success: function () {$("#content").load("friend.do");}
		});
	}

</script>