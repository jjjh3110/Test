<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta  http-equiv="Content-Type" content="text/html" charset="UTF-8">
		<title>월드잡프렌즈</title>
		<link rel="stylesheet" href="/js/common/css/reset.css">
		<link rel="stylesheet" href="/js/common/css/style.css">
		<link rel="stylesheet" href="/js/common/css/common.css">
		<!-- Swiper CSS -->
        <link rel="stylesheet" href="/js/common/swiper/css/swiper.css">
		<!-- Swiper JS -->
        <script src="/js/common/swiper/js/swiper.min.js"></script>
        <script type="text/javascript" src="/js/common/jquery/jquery-3.2.1.js"></script>
	
		<script type="text/javascript">
			$(function(){
				
				/*메뉴 열기*/
				$("#menu li a").click(function(){
					var container = $("#subMenu");
					if(container.is(":visible")){
						container.slideUp();
					}else{
						container.slideDown();
					}
				});
				/*외부영역 클릭시 메뉴닫기*/
				$(document).mouseup(function (e){
					var container = $("#subMenu");
					if( container.has(e.target).length === 0)
					container.slideUp();
				});

		
				$("#btnLogin").click(function() {
					$.ajax({
						type: "post",
						url: "/member/loginProcAjax.do",
						data: {
							memberId: $("#memberId").val(),
							memberPw: $("#memberPw").val()
						},
						dataType: "json",
						success: function(data) {
							console.log(data);
							
							if(data.result == "ok") {
								location.replace("/index.do");
								return;
							} else {
								alert("로그인을 실패하였습니다.");
								$("#memberPw").focus();
							}
							
						},
						error: function(xhr, status, error) {
							console.log(xhr);
							alert("error\nxhr : " + xhr + ", status : " 
									+ status + ", error : " + error);      
						}
					});
					
				});
				
			});
		</script> 
    </head>
	<body>
		<!-- wrap : s -->
		<div id="wrap">
			<!-- 오른쪽창 : s -->
			<div class="side_wrap">
				<ul>
					<li><a href="#"><img src="/images/headphone.png" alt="온라인상담" /><p>온라인 상담</p></a></li>
					<li><a href="#"><p>온라인 상담</p></a></li>
					<li><a href="#"><p>온라인 상담</p></a></li>
					<li><a href="#"><p>온라인 상담</p></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#"></a></li>
					<li><a href="#">숨기기</a></li>
					<li><a href="#"><img src="/images/call.png" alt="고객센터"><h4>고객센터<br />070-7012-1090</h4><p>(평일 10:00 ~ 19:00)</p></a></li>
				</ul>
			</div>
			<!-- 오른쪽창 : e -->
			<!-- header : s -->
			<div id="header">
				<div class="top_header">
					<div class="clear_after grid">
						<div class="left logo">
							<a href="#"><img src="/images/logo.png" alt="logo" /></a>
						</div>
						<div class="right">
							<div class="sns">
								<ul>
									<li><a href="#">1</a></li>
									<li><a href="#">2</a></li>
									<li><a href="#">3</a></li>
									<li><a href="#">4</a></li>
									<li><a href="#">5</a></li>
									<li><a href="#">6</a></li>
								</ul>
							</div>
							<div class="login">
								<ul>
									<li><a href="#">JOIN</a></li>
									<li><a href="#">LOGIN</a></li>
									<li><a href="#"><span class="orange">Q&amp;A</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="clear clear_after menu">
					<div class="grid">
						<ul id="menu">
							<li><a href="#">회사소개<br /><span>(About)</span></a></li>
							<li><a href="#">공지&amp;뉴스<br /><span>(Notice&amp;News)</span></a></li>
							<li><a href="#">정부지원 안내<br /><span>(Government Support)</span></a></li>
							<li><a href="#">해외취업정보<br /><span>(Careers Infomation)</span></a></li>
							<li><a href="#">구인의뢰<br /><span>(Job Offer)</span></a></li>
							<li><a href="#">호주이민<br /><span>(Immigration Aus)</span></a></li>
							<li><a href="#">워킹홀리데이<br /><span>(Working Hoilday)</span></a></li>
							<li><a href="#">각종서식자료<br /><span>(Down Document)</span></a></li>
						</ul>
					</div>
				</div>
				<!-- 서브메뉴 : S -->
				<div id="subMenu" class="submenu" style="display:none;">
					<ul class="grid clear_after">
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">인사말</a></li>
								<li class="list"><a href="#">사업인허가</a></li>
								<li class="list"><a href="#">국내외 계좌안내</a></li>
								<li class="list"><a href="#">찾아오시는 길</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">K-move 자료</a></li>
								<li class="list"><a href="#">취업박람회 안내</a></li>
								<li class="list"><a href="#">연수기관 홍보</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">해외취업정부지원 안내</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="http://www.higc.net/bin/minihome/neo_main758.htm?seq=9351&_aldo=148" target="_blank">해외취업정부지원</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
							</ul>
						</li>
						<li class="smenu">
							<ul class="menu_list ">
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
								<li class="list"><a href="#">menu</a></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- 서브메뉴 : E -->
			</div>
			<!-- header : e -->
			<!-- container : s -->
			<div id="container" class="after_clear">
				<!-- sub : s -->
				<div class="sub_main">
					<div class="top_banner">
					
					</div>
					<div class="grid clear_after">
						<div class="sub_menu left">
							<ul>
								<li class="top ff_sh">회원정보 <span class="ff_mj fs_28">Member</span></li>
								<li><a href="#">로그인</a></li>
								<li><a href="#">회원가입</a></li>
								<li><a href="#">ID/PW 찾기</a></li>
								
							</ul>
						</div>
						<div class="sub_inner right">
							<div class="sub_title clear_after">
								<h4 class="fc_333 fs_28 ff_sh">로그인</h4>
								<ul>
									<li>홈</li>
									<li>></li>
									<li>회원정보</li>
									<li>></li>
									<li>로그인</li>
								</ul>
							</div>
							<!-- sub 내용 : s -->
							<div class="inner_cont">
								<div class="login">
									<div class="radio">
										<label><input type="radio" class="radio01" />개인회원</label>&nbsp;&nbsp;&nbsp;
										<label><input type="radio" class="radio01" />기업회원</label>
									</div>
									<input type="text" id="memberId" placeholder="아이디" />
									<input type="password" id="memberPw" placeholder="비밀번호" />
									<button type="button" class="btn_03 btn_f fs_16" id="btnLogin">로그인</button>
									<div class="mt_5 find">
										<ul>
											<li>혹시 아직 회원이 아니신가요?<a href="#">회원가입</a></li>
											<li>아이디랑 비밀번호를 잊어버리셨나요?<a href="#">ID/PW찾기</a></li>
										</ul>
									</div>
								</div>
							</div>
							<!-- sub 내용 : e -->
						</div>
					</div>
				</div>
				<!-- sub : e -->
			</div>
			<!-- container : e -->
				
			<!-- footer : s -->
			<div id="footer">
				<div class="f_top">
					<div class="grid clear_after">
						<div class="left" style="width:55%;">
							<p class="tit blue">월드잡 프렌즈는 대한민국<br /> 청년들의 해외 취업 성공을 응원합니다.</p>
							<p class="call">친절 상담전화<br />070.7012.1090 / 070.5033.0877</p>
							<p class="addr clear">
								지하철 2호선/신분당선 강남역 4번출구에서 스칼라티움방향으로 보도 약 5분 정도 거리<br /> 지하철 이용 역삼역 3번출구에서 500m 직진후 기업은행에서 좌회전 5분거리
							</p>
						</div>
						<div class="right" style="width:40%;">
							<img src="/images/map.png" alt="약도" />
						</div>
					</div>
				</div>
				<div class="f_bottom">
					<div class="grid after_clear">
						<div class="left">
							<div class="logo">
								<img src="/images/f_logo.png">
							</div>
						</div>
						<div class="right">
							<div class="f_cont">
								<ul>
									<li>상호명 : 월드잡프렌즈&nbsp;&nbsp;&nbsp;사업자 등록 번호 : 884-92-00285&nbsp;&nbsp;&nbsp;직업소개소 등록번호 : F1200320170004</li>
									<li>문의 전화 : 070-7012-3938&nbsp;&nbsp;&nbsp;FAX : 070-5033-0877</li>
									<li>대표이사 : 박상균&nbsp;&nbsp;&nbsp;개인정보보호관리 책임자 : 박상균</li>
									<li>사업장 주소 : 서울특별시 강남구 논현로79길 57 2층</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="clear center fff fs_12" style="background-color:#454545; padding:0 0 10px 0; letter-spacing:0.5px; font-weight:400">
					Copyright 2017. WORLD JOB FRIENDS All pictures cannot be copied without permission.
				</div>
			</div>
			<!-- footer : e -->
		</div>
		<!-- wrap : e -->
	

    </body>
</html>