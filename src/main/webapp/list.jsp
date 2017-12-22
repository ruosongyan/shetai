<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>诊断系统</title>
  <!-- Bootstrap core CSS-->
  <link href="<%= request.getContextPath() %>/staticfile/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="<%= request.getContextPath() %>/staticfile/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="<%= request.getContextPath() %>/staticfile/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="<%= request.getContextPath() %>/staticfile/css/sb-admin.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">
  <!-- Plugin CSS -->
  <link href="<%= request.getContextPath() %>/staticfile/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">
  <!-- Custom styles for this template -->
  <link href="<%= request.getContextPath() %>/staticfile/css/freelancer.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/staticfile/css/jquery.dataTables.min.css">
  <link href="<%= request.getContextPath() %>/staticfile/css/message.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
    <a class="navbar-brand" href="index.html">诊断系统</a>
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
          <a class="nav-link" href="info">
            <i class="fa fa-fw fa-dashboard"></i>
            <span class="nav-link-text">个人信息</span>
          </a>
        </li>
        <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Components">
          <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#collapseComponents" data-parent="#exampleAccordion">
            <i class="fa fa-fw fa-wrench"></i>
            <span class="nav-link-text">诊断信息</span>
          </a>
          <ul class="sidenav-second-level collapse" id="collapseComponents">
            <li>
              <a href="appoint.jsp">申请诊断</a>
            </li>
            <li>
              <a href="list">诊断记录</a>
            </li>
          </ul>
        </li>
      </ul>
      <ul class="navbar-nav sidenav-toggler">
        <li class="nav-item">
          <a class="nav-link text-center" id="sidenavToggler">
            <i class="fa fa-fw fa-angle-left"></i>
          </a>
        </li>
      </ul>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle mr-lg-2" id="messagesDropdown" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            <i class="fa fa-fw fa-envelope"></i>
            <span class="d-lg-none">Messages
              <span class="badge badge-pill badge-primary">New</span>
            </span>
            <span class="indicator text-primary d-none d-lg-block">
              <i class="fa fa-fw fa-circle"></i>
            </span>
          </a>
          <div class="dropdown-menu" aria-labelledby="messagesDropdown">
            <h6 class="dropdown-header">New Messages:</h6>
            <div class="dropdown-divider"></div>
            <s:iterator value="noticeList" id="n" status="st">
            	<a class="dropdown-item" href="#" onclick="viewNotice(this)">
	              <strong class="notice-title"><s:property value="uname"/></strong>
	              <span class="small float-right text-muted notice-date"><s:property value="date"/></span>
	              <div class="dropdown-message small notice-content"><s:property value="content"/></div>
	            </a>
	            <div class="dropdown-divider"></div>
            </s:iterator>
            <a class="dropdown-item small" href="#">查看所有通知</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- Modal -->	
	<div class="modal fade" id="noticeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	      	<h4 class="modal-title" id="myModalLabel">Modal title</h4>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	      </div>
	      <div class="modal-body">
	        ...
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	      </div>
	    </div>
	  </div>
	</div>
  <div class="content-wrapper">
    <div class="container-fluid">
		<div class="container">
	        <table id="table_id" class="display">
			    <thead>
			    <tr>
			        <th>#</th>
			        <th>日期</th>
			        <th>时间段</th>
			        <th>分类</th>
			        <th>操作</th>
			    </tr>
			    </thead>
			    <tbody>
			    </tbody>
			</table>
		</div>
	      
    </div>
    <!-- /.container-fluid-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © Your Website 2017</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
          <div class="modal-footer">
            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
            <a class="btn btn-primary" href="login.html">Logout</a>
          </div>
        </div>
      </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="<%= request.getContextPath() %>/staticfile/vendor/jquery/jquery.min.js"></script>
    <script src="<%= request.getContextPath() %>/staticfile/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="<%= request.getContextPath() %>/staticfile/vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <!--  <script src="<%= request.getContextPath() %>/staticfile/vendor/chart.js/Chart.min.js"></script> -->
    <script src="<%= request.getContextPath() %>/staticfile/vendor/datatables/jquery.dataTables.js"></script>
    <script src="<%= request.getContextPath() %>/staticfile/vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="<%= request.getContextPath() %>/staticfile/js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="<%= request.getContextPath() %>/staticfile/js/sb-admin-datatables.min.js"></script>
    <script src="<%= request.getContextPath() %>/staticfile/js/sb-admin-charts.min.js"></script>
    
    <!-- Plugin JavaScript -->
    <script src="<%= request.getContextPath() %>/staticfile/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
    <!-- Contact Form JavaScript -->
    <script src="<%= request.getContextPath() %>/staticfile/js/jqBootstrapValidation.js"></script>
    <script src="<%= request.getContextPath() %>/staticfile/js/contact_me.js"></script>
	<script type="text/javascript" charset="utf8" src="<%= request.getContextPath() %>/staticfile/js/jquery.dataTables.min.js"></script>
	<script src="<%= request.getContextPath() %>/staticfile/js/message.js"></script>
	<script src="<%= request.getContextPath() %>/staticfile/js/notice.js"></script>
	<script>
		$(document).ready( function () {
		       var tables=$('#table_id').DataTable({
		    	   	dom: '<"top"f>rt<"bottom"ip><"clear">',
					language: {
						search: ""
					},
					iDisplayLength: 15,//分页大小
		           "ajax":{
		           	url: "photolist",
					dataSrc: function(json) {
						//处理返回数据
						var obj= eval('(' + json + ')');
						obj.forEach(function(item,index) {
							item["index"] = index+1;
		                    item["upload_date"] = item.upload_date;
		                    switch(item.time){
		                    case 0:
		                    	item["time"]="早上";
		                    	break;
		                    case 1:
		                    	item["time"]="中午";
		                    	break;
		                    case 2:
		                    	item["time"]="晚上";
		                    	break;
		                    default:
		                    	item["time"]="无";
		                    		
		                    }
		                    item["tid"] = "舌苔";
						var deleteBtn='<a class="delete" data-id="'+ item.pid +'" href="#" style="color:#d87a80;"><i class="fa fa fa-trash"></i></a>';
						var editBtn='<a class="edit" data-id="'+ item.pid +'" href="#" style="color:#5ab1ef;"><i class="fa fa fa-edit"></i></a>';
						var detailBtn='<a class="detail" data-id="'+ item.pid +'" href="#" style="color:#97b552;"><i class="fa fa-search-plus"></i></a>';
						item["operation"] =detailBtn+"&nbsp;&nbsp;&nbsp;"+editBtn+"&nbsp;&nbsp;"+deleteBtn;
					})
					return obj;
		           }
					},
			           columns: [//定义接受到的数据，“key”
			               { data: 'index' },
			               { data: 'upload_date' },
			               { data: 'time' },
			               { data: 'tid' },
			               { data : 'operation'}
			           ],
			           "fnRowCallback": function( nRow, aData, iDisplayIndex ) {
							/* Append the grade to the default row class name */
							$('td:eq(0)', nRow).html( '<b>'+$('td:eq(0)', nRow).html()+'</b>' );
							return nRow;
				 		}
		       })
		       
		       //查看详情
				$("#table_id").on("click",".detail",function(){
					var id = $(this).data("id");
					console.log(id);
					window.location.href="detail?id="+id+"&backurl="+window.location.href; 
				})
				
				//删除
				$("#table_id").on("click",".delete",function(){
					var id = $(this).data("id");
					var table = $('#table').DataTable();
					var row = table.row($(this).parents('tr'));
					$.post('delete', {
						pid: id
					}, function(data) {
						row.remove().draw(false); 
						$.message('删除成功');
						setTimeout("location.reload()",800)
						
					});
				})
				
				//修改
				$("#table_id").on("click",".edit",function(){
					var id = $(this).data("id");
					console.log(id);
					window.location.href="editPage?id="+id+"&backurl="+window.location.href; 
				})
		})
	</script>
  </div>
</body>

</html>