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
							<col width="5%">
							<col width="*%">
							<col width="15%">
							<col width="10%">
							<col width="10%">
							<col width="15%">
						</colgroup>
						<thead>
						    <tr class="primary">
						        <th class="tac">사용월</th>
								<th style="text-align:center !important;">제품명</th>
								<th class="tac">소비전력</th>
								<th class="tac">사용일수</th>
								<th class="tac">사용시간</th>
								<th class="tac">사용전력량</th>
						    </tr>
						</thead>
					</table>
				</div>
			</div>			
		</div>		
		
	</div>	
</div>

<div class="modal fade" id="modal-dialog">
    <div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
            	<h5 class="modal-title fw">사용량 입력</h5>
               	<button type="button" class="btn btn-close btn-close-black" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
        		<h5>월별 사용량을 입력해주세요 </h5>                	
				<span>월 : </span><input type="text" id="use_month" />
				<span>제품명 : </span><input type="text" id="elct_nm" />

			</div>
			<div class="modal-footer btn-wrap">
            	<div id="enableId" >
                	<a type="button" class="btn btn-primary wid-60" onclick="setMonthUsage();">적용</a>
					<a type="button" class="btn btn-outline-primary wid-60" data-bs-toggle="modal" onclick="initModal();">닫기</a>
                </div>
			</div>
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
				"url":"${wasPath}/monthUsageList"
				,"type" : "GET"
				,"dateSrc" : "data"				
			}
			,"columns":[
				{  "data":"use_month","class":"tac"}
				, {"data":"elct_nm", "class":"tac"}
				, {"data":"elct_pwr", "class":"tal"}
				, {"data":"use_days", "class":"tal"}
				, {"data":"use_hours", "class":"tal"}
				, {"data":"use_pwr", "class":"tal"}
				, {"data":"", "class":""}
			]
			,"columnDefs":[
				{"defaultContent" : "", targets:"_all" }
				, {"targets":[6], "render": function(data,type,full){
						return "<a href='#' onclick='updateMonthUsage(\""+full.use_month+"\", \""+full.elct_nm+"\")'> 변경 </a>";
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

	function setMonthUsage() {
		$("#modal-dialog").modal('show');		
	}
	
	function updateMonthUsage(useMonth, elctNm) {
		
	}
	
	
</script>
</body>
</html>
