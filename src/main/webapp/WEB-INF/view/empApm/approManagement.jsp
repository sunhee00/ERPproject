<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<style type="text/css">
.empty {
	height: 10px;
}

.emptySpace1 {
	display: inline-block;
	width: 100px;
}

.emptySpace2 {
	display: inline-block;
	width: 10px;
}

.emptySpace3 {
	display: inline-block;
	width: 10px;
}

.emptySpace5 {
	height: 10px;
}

.emptySpace6 {
	display: inline-block;
	width: 10px;
}

.inputCheck input[type="radio"] {
	width: 5px;
	height: 5px;
}

#appro_req_date {
	font-size: small;
}

#expen_date {
	font-size: small;
}

.label-font {
	font-size: 15px;
	font-weight: bold;
}

.border-line {
	display: flex;
	align-items: center;
	justify-content: center;
	padding-top: 20px;
	position: relative;
}

.inputSpace {
	position: absolute;
	margin-left: 10px;
}

.search-btn {
	font-weight: bold;
	font-size: 16px;
	color: black;
}

.btnTypegray {
	background-color: #c0c0c0;
	border-radius: 2px;
	width: 120px;
	height: 22px;
	position: relative;
	left: 485px;
	bottom: 27px;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-top: 5px;
}
</style>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>결재 관리</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
	// 페이징 설정
	var pageSize = 10;
	var pageBlockSize = 5;

	/** OnLoad event */
	$(function() {
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
		fn_approveSearch();
	});

	/** 버튼 이벤트 등록 */

	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');

			switch (btnId) {
			case 'btnSearch':
				fn_approveSearch();
				break;
			case 'btnSaveFile':
				fn_savefile();
				break;
			case 'btnClose':
			case 'btnCloseFile':
				gfCloseModal();
				break;
			}
		});
	}

	function fn_approveSearch(pagenum) {
		console.log("fn_approveSearch called ");
		pagenum = pagenum || 1;
		/* 왼쪽 변수값에 오른쪽 변수값을 넣음*/
		var param = {
			from : $("#from").val(),
			to : $("#to").val(),
			appro_yn : $("#appro_yn").val(),
			appro_type_cd : $("#appro_type_cd").val(),
			sname : $("#sname").val(),
			pageSize : pageSize,
			pageBlockSize : pageBlockSize,
			pagenum : pagenum
		}

		/* pagenation */
		var listcallback = function(returnvalue) {
			console.log(returnvalue);

			$("#approManagement").empty().append(returnvalue);

			var totalcnt = $("#totalcnt").val();

			console.log("totalcnt : " + totalcnt);

			var paginationHtml = getPaginationHtml(pagenum, totalcnt, pageSize,
					pageBlockSize, 'fn_approveSearch');
			console.log("paginationHtml : " + paginationHtml);

			$("#listPagination").empty().append(paginationHtml);

			$("#pageno").val(pagenum);
		}

		callAjax("/empApm/approManagementList.do", "post", "text", false,
				param, listcallback);

	}

	/* 모달파트 */

	function fn_selectone(no) {

		var param = {
			appro_no : no
		}
		// 이거는 딕셔너리 어프로노가 키고 no가 값입니다 그걸 파라미터로 받아요

		// 그럼 얘가 데이터를 서버에서 전달 받는거죠
		var selectonecallback = function(returndata) {
			console.log(JSON.stringify(returndata));
			// 받은 값을 한번 찍어보고
			popupinitfile(returndata.listSearch);
			// 받은 값의 listSearch 값을 팝업 초기화 하는데 쓴다.
			// 안에 값을 넣는거겠죠? 
			//팝업

			// 모달 팝업
			gfModalPop("#layer2");
			//팝업형태

		}

		callAjax("/empApm/listSelectOneApm.do", "post", "json", false, param,
				selectonecallback);
		// 하여튼 이 코드는 
		// param 값을 /empApm/listSelectOneApm.do 를 post 로 호출할때 전달한다
		// 결과 값은 selectonecallback 에서 전달 받는다
		// 그러면 애초에 이 함수 fn_selectone(no) 에서 no 를 파라미터로 받는 이유
		// appro_no 가필요한 이유는?
		// 서버가 필요하다니까
		// 마라탕 주문하는데 주문서가 필요하니까
		// 주문서에 appr_no 가 필수항목이니까 그럼 서버에서 뭘 요구하는지 가서 보며

	}

	function fn_Validate() {

		var chk = checkNotEmpty([ [ "appro_type_cd", "결재여부을 선택해주세요." ],
				[ "dept_cd", "부서를 선택해주세요." ]

				, [ "acnt_dt_sbject_cd", "계정상세를 선택해주세요" ]

		]);

		if (!chk) {
			return;
		}

		return true;
	}

	function fn_openpopupfile() {
		popupinitfile();

		// 모달 팝업
		gfModalPop("#layer2");
	}

	// 이것도 몽자 코드안에 있던거네 
	// 아래 코드 읽어보면 뭐하는 놈인지 알수있는거지
	// 일단 이름만 봤을때 popup init file 이니까 팝업화면 초기화 할때 쓰는 거네, 그래고 받은 객체가 비어있지 않을경우
	// 그 객체 내에서 #appr_type_cd 부터 해서 줄줄이 사탕으로 값을 가져오는거고 그걸로 뭐 다운로드나 이런거 만드는거네 
	function popupinitfile(object) {

		if (object == "" || object == null || object == undefined) {
			$("#appro_type_cd").val("");
			$("#dept_cd").val("");
			$("#loginID").val("");
			$("#name").val("");
			$("#acnt_sbject_cd").val("");
			$("#acnt_dt_sbject_cd").val("");
			$("#expen_inf").val("");
			$("#expen_shop").val("");
			$("#expen_price").val("");
			$("#expen_report_no").val("");
			$("#appro_req_date").val("");
			$("#expen_date").val("");
			$("#upfile").val("");
			$("#appro_yn").val("");
			$("#budget_no").val("");

			$("#previewdiv").empty();

			$("#btnSaveFile").show();
			$("#btnDeleteFile").hide();

			$("#action").val("I");
		} else {

			$("#appro_type_cd").val(object.appro_type_cd);
			$("#dept_cd").val(object.dept_cd);
			$("#loginID").val(object.loginID);
			$("#name").val(object.name);
			$("#acnt_sbject_cd").val(object.acnt_sbject_cd);
			selectComCombo("accd", "acnt_dt_sbject_cd", "all",
					object.acnt_sbject_cd, object.acnt_dt_sbject_cd);
			$("#expen_inf").val(object.expen_inf);
			$("#expen_shop").val(object.expen_shop);
			$("#expen_price").val(object.expen_price);
			$("#expen_report_no").val(object.expen_report_no);
			$("#appro_req_date").val(object.appro_req_date);
			$("#expen_date").val(object.expen_date);
			$("#upfile").val(object.upfile);
			$("input[name='appro_yn'][value='" + object.appro_yn + "']").prop(
					"checked", true);
			$("#appro_rej_reason").val(object.appro_rej_reason);
			$("#appro_no").val(object.appro_no);
			$("#budget_no").val(object.appro_no);

			if (object.appro_yn === "Y") {
				$("#btnSaveFile").hide();
			} else {
				$("#btnSaveFile").show();

			}

			var inserthtml = "<a href='javascript:fn_filedownload()'>";

			if (object.file_name == "" || object.file_name == null
					|| object.file_name == undefined) {
				inserthtml += "";
			} else {
				var selfile = object.file_name;
				var selfilearr = selfile.split(".");
				var lastindex = selfilearr.length - 1;
				if (selfilearr[lastindex].toLowerCase() == "jpg"
						|| selfilearr[lastindex].toLowerCase() == "gif"
						|| selfilearr[lastindex].toLowerCase() == "jpeg"
						|| selfilearr[lastindex].toLowerCase() == "png") {
					inserthtml += "<img src='" + object.logic_path + "' style='width:100px; height:80px' />";
				} else {
					inserthtml += object.file_name;
				}
			}

			inserthtml += "</a>"

			$("#previewdiv").empty().append(inserthtml);

			$("#btnDeleteFile").hide();

			$("#action").val("U");
		}
	}

	function preview(event) {
		var image = event.target;

		if (image.files[0]) {

			var selfile = image.files[0].name;
			var selfilearr = selfile.split(".");
			var inserthtml = "";
			var lastindex = selfilearr.length - 1;

			if (selfilearr[lastindex].toLowerCase() == "jpg"
					|| selfilearr[lastindex].toLowerCase() == "gif"
					|| selfilearr[lastindex].toLowerCase() == "jpge"
					|| selfilearr[lastindex].toLowerCase() == "png") {
				inserthtml = "<img src='"
						+ window.URL.createObjectURL(image.files[0])
						+ "' style='width:100px; height:80px' />";
			} else {
				inserthtml = selfile;
			}

			$("#previewdiv").empty().append(inserthtml);
		}

	}

	function fn_save() {

		if (!fn_Validate()) {
			return;
		}

		var param = {

			action : $("#action").val(),
			appro_type_cd : $("#appro_type_cd").val(),
			dept_cd : $("#dept_cd").val(),
			loginID : $("#loginID").val(),
			name : $("#name").val(),
			acnt_sbject_cd : $("#acnt_sbject_cd").val(),
			acnt_dt_sbject_cd : $("#acnt_dt_sbject_cd").val(),
			expen_inf : $("#expen_inf").val(),
			expen_shop : $("#expen_shop").val(),
			expen_price : $("#expen_price").val(),
			appro_req_date : $("#appro_req_date").val(),
			expen_date : $("#expen_date").val(),
			appro_yn : $("#appro_yn").val()
		}

		var savecallback = function(reval) {
			console.log(JSON.stringify(reval));

			if (reval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();

				if ($("#action").val() == "U") {
					fn_approveSearch($("#pageno").val());
				} else {
					fn_approveSearch();
				}
			} else {
				alert("오류가 발생 되었습니다.");
			}
		}

		//callAjax("/mngNot/noticesave.do", "post", "json", false, param, savecollback) ;
		callAjax("/empApm/listSaveApm.do", "post", "json", false, $("#myForm")
				.serialize(), savecallback);

	}

	function fn_savefile() {

		var param = {
			appro_yn : $("input[name='appro_yn']:checked").val(),
			appro_no : $("#appro_no").val(),
			appro_rej_reason : $("#appro_rej_reason").val(),
			budget_no : $("#budget_no").val(),
			acnt_sbject_cd : $("#acnt_sbject_cd").val(),
			acnt_dt_sbject_cd : $("#acnt_dt_sbject_cd").val(),
			expen_report_no : $("#expen_report_no").val(),
			action : $("#action").val()
		}

		/* var frm = document.getElementById("myForm");
		frm.enctype = 'multipart/form-data';
		var fileData = new FormData(frm); */

		var filesavecallback = function(returnval) {
			console.log(JSON.stringify(returnval));

			if (returnval.returncval > 0) {
				alert("저장 되었습니다.");
				gfCloseModal();

				if ($("#action").val() == "U") {
					fn_approveSearch($("#pageno").val());
				} else {
					fn_approveSearch();
				}
			} else {
				alert("오류가 발생 되었습니다.");
			}
		}

		//callAjaxFileUploadSetFormData("/accEps/listSaveFileEps.do", "post", "json", true, fileData, filesavecallback);
		callAjax("/accEps/listSaveFileEps.do", "post", "json", true, param,
				filesavecallback);

	}

	function fn_filedownload() {
		alert("다운로드");

		var params = "";
		params += "<input type='hidden' name='appro_no' id='appro_no' value='"
				+ $("#appro_no").val() + "' />";

		jQuery(
				"<form action='/empApm/downloadListFileApm.do' method='post'>"
						+ params + "</form>").appendTo('body').submit()
				.remove();

	}
</script>



</script>

</head>

<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="action" name="action" /> <input
			type="hidden" id="appro_no" name="appro_no" /> <input type="hidden"
			id="pageno" name="pageno" /> <input type="hidden" id="appro_type_cd"
			name="appro_type_cd" /> <input type="hidden" id="no" name="no" /> <input
			type="hidden" id="dept_name" name="dept_name" /> <input
			type="hidden" id="loginID" name="loginID" /> <input type="hidden"
			id="name" name="name" /> <input type="hidden" id="req_date"
			name="req_date" /> <input type="hidden" id="appro_yn"
			name="appro_yn" /> <input type="hidden" id="appro_date"
			name="appro_date" /> <input type="hidden" id="appro_bos"
			name="appro_bos" /> <input type="hidden" id="dept_name"
			name="dept_name" />



		<!-- 모달 뷰 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">

							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">인사</span> <span class="btn_nav bold">결재
									관리 </span> <a href="../accEps/expenseSearch.do"
									class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>결재 관리</span> <span class="fr">
							</p>

							<div
								style="border: solid 3px #c0c0c0; height: 120px; border-radius: 10px;"
								class="border-line">
								<div>
									<span class="label-font">신청일자: &nbsp; </span> <input
										type="date" id="from" name="from"
										style="width: 120px; height: 25px; font-size: 15px"> <label
										for="to"> - </label> <input type="date" id="to" name="to"
										style="width: 120px; height: 25px; font-size: 15px"> <span
										class="label-font">&nbsp;&nbsp;&nbsp;&nbsp;결재여부: &nbsp;</span>
									<select id="appro_yn" name="appro_yn"
										style="width: 120px; height: 27px; font-size: 15px"">
										<option value=" ">전체</option>
										<option value="Y ">결재</option>
										<option value="N ">반려</option>
									</select> <span class="label-font ">&nbsp;&nbsp;&nbsp;&nbsp;결재유형:&nbsp;</span>
									<select id="appro_type_cd " name="appro_type_cd "
										style="width: 120px; height: 27px; font-size: 15px"">
										<option value="">전체</option>
										<option value="발주">발주</option>
										<option value="휴가">휴가</option>
									</select>
									<div class="emptySpace5"></div>

									<span class="emptySpace1"></span><span class="label-font">&nbsp;&nbsp;&nbsp;&nbsp;사원명:
									</span> <input type="text"
										style="width: 150px; height: 25px; font-size: 15px" id="sname"
										name="sname" class="inputSpace">
									<div class="btnTypegray"
										style="margin-top: 8px; margin-right: 12px;">
										<a href="" id="btnSearch" name="btn"><span
											class="search-btn" style="margin-top: 100px;">검 색</span> </a>
									</div>

								</div>
							</div>
							<div class="empty"></div>


							<div class="noticeList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>

										<col width="5%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">

									</colgroup>

									<thead>
										<tr>
											<th scope="col">결재번호</th>
											<th scope="col">결재유형</th>
											<th scope="col">부서명</th>
											<th scope="col">사번</th>
											<th scope="col">이름</th>
											<th scope="col">결재요청일</th>
											<th scope="col">결재여부</th>
											<th scope="col">결재일</th>
											<th scope="col">결재자</th>
											<th scope="col">결재</th>

										</tr>
									</thead>
									<tbody id="approManagement"></tbody>
								</table>
							</div>

							<div class="paging_area" id="listPagination"></div>


						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>




		<!-- 모달팝업 -->

		<div id="layer2" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>결재</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<colgroup>
							<col width="120px">
							<col width="*">
							<col width="120px">
							<col width="*">
						</colgroup>

						<tbody>
						<tr>
							<th scope="row">발주번호 </th>
							<td ><input type="text" class="inputTxt p100" name="expen_shop" id="expen_shop" /></td>
							<th scope="row">공급업체명 </th>
							<td ><input type="text" class="inputTxt p100" name="expen_price" id="expen_price" /></td>
						</tr>
						<tr>
							<th scope="row">사번 </th>
							<td ><input type="text" class="inputTxt p100" name="splr_name" id="splr_name" /></td>
							<th scope="row">사원명</th>
							<td ><input type="text" class="inputTxt p100" name="name" id="name" /></td>
						</tr>
						<tr>
							<th scope="row">제품명</th>
							<td ><input type="text" class="inputTxt p100" name="product_name" id="product_name" /></td>
							<th scope="row">제품 단가</th>
							<td ><input type="text" class="inputTxt p100" name="product_unit_price" id="product_unit_price" /></td>
						</tr>
						<tr>
							<th scope="row">제품 주문 수량</th>
							<td ><input type="text" class="inputTxt p100" name="dlv_amt" id="dlv_amt" /></td>
							<th scope="row">총 금액</th>
							<td ><input type="text" class="inputTxt p100" name="expen_price" id="expen_price" /></td>
						</tr>																			
							<tr>
								<th scope="row">결재</th>
								<td><input type="radio" class="inputCheck" name="appro_yn"
									value="Y" />&nbsp;결재</td>
								<th scope="row">반려</th>
								<td><input type="radio" class="inputCheck" name="appro_yn"
									value="N" />&nbsp;반려</td>
							</tr>

							<tr>
								<th scope="row">반려사유</th>
								<td colspan="3"><textarea id="appro_rej_reason"
										name="appro_rej_reason"> </textarea></td>
							</tr>

						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveFile" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnDeleteFile" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnCloseFile" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>


		<!--// 모달팝업 -->
	</form>
</body>

</html>