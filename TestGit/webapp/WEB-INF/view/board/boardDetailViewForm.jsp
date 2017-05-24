<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script type="text/javascript">
		//전체 댓글의 개수
		var replyListTotCount = 0;
		//startRow 값
		var replyStartRow = 0;
		

		$(function() {
			$(window).scroll(function(){ 
				if(replyListTotCount > replyStartRow){
			        if ($(window).scrollTop() >= $(document).height() - $(window).height()){  
			        	showNextReplyList();
			        }  
				}
			});
			
			$.ajax({
				type: "post",
				url: "/board/boardDetailViewAjax.do",
				data: {
					no:"${param.no}"
				},
				dataType: "json",
				success: function(data) {
					printLog(data);
					
					if(data.result == "ok") {
						var board = data.boardBean;
						$("#boardNo").text(board.no);
						$("#regDate").text(board.regDate);
						$("#memberId").text(board.memberId);
						$("#memberName").text(board.memberName);
						$("#title").text(board.title);
						$("#content").text(board.content);
						
						$.each(data.boardReplyList, function(i, mBean) {
							var str = "";
							str += "<tr>";
							str +="<td>"+(i+1)+"</td>";
							str += "<td>" + mBean.memberId + "</td>";
							str += "<td>" + mBean.memberName + "</td>";
							str += "<td><pre>" + mBean.content + "</pre></td>";
							str += "<td>" + mBean.regDate + "</td>";
							str += "<td><button type='button' onclick=delMember('" 
									+ mBean.memberId + "')>삭제</button></td>";
							str += "</tr>";
							
							$("#boardReplyInfo").append(str);
						});
						//더보기 버튼에 대한 처리
						replyListTotCount = board.replyTotCount;
						replyStartRow = data.boardReplyList.length;
						if(replyListTotCount > replyStartRow){
							//댓글 더보기 버튼 화면에 표시
							$("#moreReplyList").show();
						}else{
							$("#moreReplyList").hide();
						}
					} else {
						alert(data.resultMsg);	
					}
					
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
		});//end ready
		//다음 댓글 List 표시
		function showNextReplyList(){
			//알고 있어야 되는 정보
			//전체 댓글의 개수
			//현재 startRow
			$.ajax({
				type: "post",
				url: "/board/boardReplyAjax.do",
				data: {
					no:"${param.no}",
					startRow : replyStartRow
				},
				dataType: "json",
				success: function(data) {
					printLog(data);
						
					if(data.result == "ok") {
						
						$.each(data.boardReplyList, function(i, mBean) {
							var str = "";
							str += "<tr>";
							str +="<td>"+(i+replyStartRow+1)+"</td>";
							str += "<td>" + mBean.memberId + "</td>";
							str += "<td>" + mBean.memberName + "</td>";
							str += "<td><pre>" + mBean.content + "</pre></td>";
							str += "<td>" + mBean.regDate + "</td>";
							str += "<td><button type='button' onclick=delMember('" 
									+ mBean.memberId + "')>삭제</button></td>";
							str += "</tr>";
							
							$("#boardReplyInfo").append(str);
						});
						//더보기 버튼에 대한 처리
						replyStartRow += data.boardReplyList.length*1;
						if(replyListTotCount > replyStartRow){
							//댓글 더보기 버튼 화면에 표시
							$("#moreReplyList").show();
						}else{
							$("#moreReplyList").hide();
						}
					} else {
						alert(data.resultMsg);	
					}
					
				},
				error: function(xhr, status, error) {
					console.log(xhr);
					alert("error\nxhr : " + xhr + ", status : " 
							+ status + ", error : " + error);      
				}
			});
		};
		
		
		
		
		
		
		</script>
</head>
<body>
	
	<div style="width: 700px;">
		<div>게시글 번호 : <span id="boardNo"></span> </div>
		<div>게시글 날짜 : <span id="regDate"></span> </div>
		<div>글쓴이 ID : <span id="memberId"></span> </div>
		<div>글쓴이 이름 : <span id="memberName"></span> </div>
		<div>게시글 제목 : <span id="title"></span> </div>
		<div>게시글 내용 : <pre id="content"></pre> </div>
	</div>
	
	<br/><br/>
	댓글목록 <br/>
	<table style="width: 700px;">
		<tbody id="boardReplyInfo">
			
		</tbody>
	</table>
	
	<br/>
	<table style="width: 700px;">
		<tr>
			<td>
				<button type="button" id="moreReplyList" onclick="showNextReplyList()">댓글 더보기</button>	
			</td>
		</tr>
	</table>
</body>
</html>