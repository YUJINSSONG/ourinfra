<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="wasPath" value="<%=request.getContextPath()%>"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
<meta content="" name="description" />
<meta content="" name="author" />

<link href="${wasPath}/plugins/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${wasPath}/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
<link href="${wasPath}/plugins/jquery-modal/jquery-modal-0.9.1.css" rel="stylesheet" type="text/css" />

<title>한전 KDN 에너지 가계부</title>

</head>
<body>
<div class="wrapper" >
	<div class="sidebar-header" style='text-align: center;'>
    	<h1>에너지 가계부</h1>
	</div>
	<nav id="sidebar" class="col-md-2" >
        <ul class="list-unstyled components">
        	<li id="link01" >
        		<a href="${wasPath}/elctView">제품현황관리</a>
        	</li>
        	<li id="link02" >
        		<a href="${wasPath}/monthUsage">제품 사용정보 관리</a>
        	</li>
        	<li id="link03" >
        		<a href="${wasPath}/welcome">제품 사용량 통계</a>
        	</li>
        </ul>
	</nav>
	
	
	
	<div id="content" class="col-md-10">
		
		<!-- 테이블시작 -->
		<div class="col-md-12">
			<div class="panel">
			    <div class="table-responsive">
			        <table id="list" class="table table-bordered table-hover table-striped table-td-valign-middle" >
						<colgroup>
							<col width="10%">							
							<col width="*">
							<col width="20%">
							<col width="5%">
						</colgroup>
						<thead>
						    <tr class="primary">
						        <th class="tac">제품ID</th>
								<th style="text-align:center !important;">제품명</th>
								<th class="tac">소비전력</th>
								<th class="tac">삭제여부</th>
						    </tr>
						</thead>
					</table>
				</div>
			</div>			
		</div>
		
		<div class="col-md-12">
			<span>제품명 : </span><input type="text" id="btnelctNm"  />
			<span>소비전력(W/hour) : </span><input type="text" id="btnelctPwr" />
			<a type='button' class="btn_search" onclick="addElct();"><i class="fa fa-tachometer"></i>등록</a>
		</div>
	</div>
</div>

<script type="text/javascript" src="${wasPath}/plugins/jquery/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${wasPath}/plugins/datatables/datatables.min.js"></script>
<script type="text/javascript" src="${wasPath}/plugins/jquery-modal/jquery-modal-0.9.1.js"></script>
<script type="text/javascript">

	$(document).ready(function() {		
 		gridList(); 
	});

	function gridList() {
		 $("#list").dataTable( {
			"processing":false
			,"autoWidth":false
			,"ordering":false
			,"destroy" : true
			,"serverSide":false
			,"ajax": {
				"url":"${wasPath}/elctList"
				,"type" : "GET"
				,"dateSrc" : "data"				
			}
			,"columns":[
				{  "data":"elct_id","class":"tac"}
				, {"data":"elct_nm", "class":"tac"}
				, {"data":"elct_pwr", "class":"tal"}
				, {"data":"", "class":"tac"}
			]
			,"columnDefs":[
				{"defaultContent" : "", targets:"_all" }
				, {"targets":[3], "render": function(data,type,full){
						return "<a href='#' onclick='deleteElct(\""+full.elct_id+"\", \""+full.elct_nm+"\")'> 삭제 </a>";
					}
				}
			]
			,"order": [[0,"asc"]]
			,"lengthMenu": [[10,15], [10, 15]]
			,"language": { 
				"zeroRecords":"<p align='center'>검색결과가 없습니다.</p>" 
					, "processing":"<div style='background-color:#fff;padding-top:15px;padding-bottom:15px;'><p align='center' style='color:#bbb; font-weight:bold;'>검색중입니다.</p></div>"  
			}
			,"sDom":'<"top">rt<"bottom"pi>'
		});		
	}
	
	function deleteElct(elctId, elctNm) {
		
		if( !confirm(elctNm + "를 삭제하시겠습니까?") ) {
			return ;
		}
		
		$.ajax({
			url : "${contextPath}/elctDelete",
			dataType : "JSON",
			data : { "elctId" : elctId
			},
			success : function(data) {
				if(data >= 1) {
					confirm("삭제되었습니다.");					
				}
				
				gridList();
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		})
	}
	
	function addElct() {
		var elct_nm = $("#btnelctNm").val();
		var elct_pwr = $("#btnelctPwr").val();
		// ToDo : 사용자가 값을 넣었는지 값에 대한 유효성 검사는 문제 없는지 확인
		
		// ToDo : ajax로 url : "${contextPath}/elctInsert", 호출
	}
	
	
</script>
</body>
</html>
