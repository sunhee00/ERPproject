<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Job Korea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script src="https://unpkg.com/axios@0.12.0/dist/axios.min.js"></script>
<script src="https://unpkg.com/lodash@4.13.1/lodash.min.js"></script>
<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
/*메인베너 영역 시작*/
.banner {
    margin-top: 10px;
    width: 100%; 
    text-align: center;
    overflow: hidden;
    position: relative;
}
.slider{
    width: 630%;
    height:100%
    overflow: hidden;
    position: relative;
}
.slider_image {
    width: 20%;
    float: left;
    margin: 0;
}
.control {
	display: inline-block;
    position: absolute;
    bottom: 5%;
    left: 45%;
    height: 20px;
    overflow: hidden;
}
.control_button {
    position: relative;
    font-size: 1.5em;
    margin: 0 10px;
    cursor: pointer;
    color: #777;
    float: left;
}
.control_button:hover {
    color: #000;
}
.control_button.active {
    color: #000;
}
/* 좌우방향키 */
.left_right_control {
    position: absolute;
    width: 100%;
    height: 100px;
    top: 250px;
    
}
.left_control {
    float: left;
    
}
.right_control {
    float: right;
    
    
    
}
/*메인베너 영역 종료*/
</style>
<script type="text/javascript">

//슬라이드
$(function () {
    //banner slide start
    $('.slider').append($('.slider_image').first().clone());
    $('.slider').prepend($('.slider_image').eq(-2).clone());
    let index=1;
    let auto;
    moveSlider(index);
    autoSlider();
    $('.control_button').click(function (){
        index=$(this).index();
        moveSlider(index+1);
    });
    $('.left_control').click(function () {
        if(index > 1 ) {
            index--;
            moveSlider(index);
        }else {
            $('.slider').css('left',-5200);
            index=3;
            moveSlider(index);
        }
    });
    $('.right_control').click(function () {
        if(index < 3 ) {
            index++;
            moveSlider(index);
        }else {
            $('.slider').css('left',0);
            index=1;
            moveSlider(index);
        }
    });
    $('.banner').hover(function () {
        clearInterval(auto);
    },function () {
        autoSlider();
    });
    function moveSlider(index) {
        $('.slider').animate({
            left:-(index*1300)
        },'slow');
        $('.control_button').removeClass('active');
        $('.control_button').eq(index-1).addClass('active');
    }
    //자동슬라이드
    function autoSlider () {
        auto=setInterval(function () {
            $('.right_control').trigger('click'); 
        },3000);
    }
    //banner slide finish
});
    
    
    

		
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<div id="wrap_area">
		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	               
					<div class="content" style="margin-bottom:20px;">
                       
						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">메인</span> <a href="../dashboard/dashboard.do"
								class="btn_set refresh">새로고침</a>
						</p>
                        <div>
						        <p class="conTitle" style="margin-bottom: 1%;">
									<span>대광유통</span> 
									<span class="fr"> 
										 DeaKwang corporation 
									</span>
								</p>	 
								<!--메인베너영역시작-->
						      	<div class="banner">
						        	<div class="slider">
						              <img class="slider_image" src="/images/admin/login/2.png" alt="sale" >
						              <img class="slider_image" src="/images/admin/login/3.png" alt="banner" >
						              <img class="slider_image" src="/images/admin/login/1.png" alt="banner" >
						        	</div>
						        	<!--컨트롤 버튼 영역-->
						        	<div class="control">
						            	<div class="control_button">●</div>
						            	<div class="control_button">●</div>
						            	<div class="control_button">●</div>
						         	</div>
						          <!--좌우 컨트롤 버튼 패널-->
						          	<div class="left_right_control">
						            	<img class="left_control" src="/images/admin/login/8.png" alt="leftControl">
						            	<img class="right_control" src="/images/admin/login/7.png" alt="rightControl">
						          	</div>
						      	</div>
						      	<!--메인베너영역종료-->		
						</div>
					</div> 
				</li>
			</ul>
		</div>
		
		<div id="noticeArea">
			
		</div>
	</div>
					

				
				
		
	


	
      
</form>
</body>
</html>