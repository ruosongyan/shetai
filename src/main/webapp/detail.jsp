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
  <link href="<%= request.getContextPath() %>/staticfile/css/detail.css" rel="stylesheet">
  <link href="<%= request.getContextPath() %>/staticfile/css/message.css" rel="stylesheet">
    <style type="text/css">
  .content-wrapper{
  text-align: center;
  }
  #img{
  width:350px;
  height:350px;
  }
  #uploadinput {
    position: absolute;
    width: 100%;
    height:100%;
    top: 0;
    left: 0;
    opacity: 0;
}
.form-group{
	margin-top:40px;
	height:40px;
}
.mybtn{
width:100px;
height:40px;
margin-bottom:50px;
}

.message{
	width:100%;
	overflow:hidden;
	padding-bottom:10px;
	border-bottom: 1px solid #e9ecef; 
	margin-bottom:10px;
}
.row1 *{
	display:inline-block;
	padding:5px;
	margin-bottom:5px;
}
.doctor{
	background-color:#932FD2;
	color:white;
}
.user{
	background-color:#FF3366;
	color:white;
}

.row3{
	color:#767676;
	margin-top:5px;
}
.time{
	float:left;
	margin-left:5px;
}
.reply{
	float:right;
	margin-right:5px;
}
.row4{
	display:none;
	padding:5px;
}

.photetype{
	display:inline-block;
	border-radius:15%;
	margin:5px;
	padding:5px;
	color:white;
	font-size:small;
}
.slide-img{
	height:220px;
}
.carousel-control-prev-icon{
	background-color:#868e96;
}
.carousel-control-next-icon{
	background-color:#868e96;
}
@media screen and (max-width : 600px){

}

@media screen and (min-width: 601px){
}
  </style>
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
		<div class="container" id="container">
			<div class="left">
				<h2 class="text-center text-uppercase text-secondary mb-0">诊断信息</h2>
		        <hr class="star-dark mb-5">
				<!-- <image  id="img" src="/dataResourceImages/<s:property value='pic_path'/>" /> -->
				<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
				  <ol class="carousel-indicators">
				  	<s:iterator value="photoList" id="p" status="st">
				  		<li data-target="#carouselExampleIndicators" data-slide-to="<s:property value="#st.index"/>" <s:if test="#st.index==0">class="active"</s:if>></li>
				  	</s:iterator>
				  </ol>
				  <div class="carousel-inner">
				  	<s:iterator value="photoList" id="p" status="st" var="position">
				  		<div class="carousel-item <s:if test="#st.index==0">active</s:if>">
					      <img class="slide-img" src="/dataResourceImages/<s:property value='position'/>">
					    </div>
				  	</s:iterator>
				  </div>
				  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="sr-only">Previous</span>
				  </a>
				  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="sr-only">Next</span>
				  </a>
				</div>
				<div class="form-group">
					<label>分类：</label>
					<s:iterator value="typeList" id="t" status="st" var="typename">
						<div class="photetype"><s:property value='typename'/></div>
					</s:iterator>
				</div>
				<div class="form-group">
					<label>拍摄日期：</label>
					<input name="date" type="date" value="2017-12-17"/>
				</div>
				<div class="form-group">
					<label>时间段：</label>
					<select name = "time">
					
						<option value ="0" <s:if test="#request.time==0">selected</s:if>>上午</option>
			 			<option value ="1" <s:if test="#request.time==1">selected</s:if>>中午</option>
			 			<option value="2" <s:if test="#request.time==2">selected</s:if>>晚上</option>
					 
					</select>
				</div>
			</div>
			<div class="right">
				<h2 class="text-center text-uppercase text-secondary mb-0">信息回复</h2>
		        <hr class="star-dark mb-5">
				<p id="pid" style="display:none;"><s:property value="pid"/></p>
				<s:iterator value="detailList" id="d" status="st">
					<div class="message">
						<div class="row1">
							<div data-sid="<s:property value="sender_id"/>" 
								<s:if test="#d.sender_type==1">class="doctor"</s:if>
								<s:if test="#d.sender_type==0">class="user"</s:if>
								><s:property value="sender_name"/></div>
							<div class="to">回复</div>
							<div data-rid="<s:property value="receive_id"/>" 
								<s:if test="#d.receive_type==1">class="doctor"</s:if>
								<s:if test="#d.receive_type==0">class="user"</s:if>
							><s:property value="receive_name"/></div>
						</div>
						<div class="row2"><s:property value="content"/></div>
						<div class="row3">
							<div class="time">--<s:property value="time"/>--</div>
							<div class="reply" >
								<a href="#" onclick="replyDiv(this)">回复</a>
							</div>
						</div>
						<div class="row4">
							<div class="input-group">
						      <input type="text" class="form-control" placeholder="请输入内容">
						      <span class="input-group-btn">
						        <button class="btn btn-success" type="button" onclick="send(this)">发送</button>
						      </span>
						    </div>
						</div>
					</div>
				</s:iterator>
			</div>
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
    <script src="<%= request.getContextPath() %>/staticfile/js/message.js"></script>
    <script src="<%= request.getContextPath() %>/staticfile/js/notice.js"></script>
	<script>
		var colors=['#007bff','#6610f2','#e83e8c','#ffc107','#28a745','#dc3545'];
		$(document).ready(function(){
			var types=$('.photetype');
			for(var i=0;i<types.length;i++){
				var rand=Math.floor(Math.random()*colors.length);
				$(types[i]).css('background-color',colors[rand]);
			}
		})
		
		function replyDiv(obj){
			var display=$(obj).parent().parent().next().css("display");
			if(display!="none"){
				$(obj).parent().parent().next().css('display','none');
			}else{
				$(obj).parent().parent().next().css('display','block');
			}
		}
		
		function send(obj){
			var content = $(obj).parent().prev().val();
			var pid=$('#pid').html();
			var sid=$(obj).parents(".row4").prevAll(".row1").children('div:first-child').data('sid');
			var rid=$(obj).parents(".row4").prevAll(".row1").children('div:last-child').data('rid');
			var sname=$(obj).parents(".row4").prevAll(".row1").children('div:first-child').html();
			var rname=$(obj).parents(".row4").prevAll(".row1").children('div:last-child').html();
			var myDate = new Date();
			var year=myDate.getFullYear().toString();
			var time=year.substr(2,2)+"-"+myDate.getMonth()+"-"+myDate.getDate();
			if(content==null || content==""){
				$.message({
  	  		        message:'内容不能为空',
  	  		        type:'error'
  	  		    });
			}else{
				$.ajax({  
                    type : "POST",  //提交方式  
                    url : "sendMessage",//路径  
                    data : {  
                        "content" : content,
                        "pid":pid,
                        "sender_id":rid,
                        "receive_id":sid
                    },
                    success : function(data) {//返回数据根据结果进行相应的处理  
                    	console.log(data);
                    	var html="";
                    	html+="<div class=\"message\">";
                    	html+="<div class=\"row1\">";
                    	html+="<div data-sid=\""+rid+"\" class=\"user\">"+rname+"</div>";
                    	html+="<div class=\"to\">回复</div>"
                    	html+="<div data-sid=\""+sid+"\" class=\"doctor\">"+sname+"</div>"
                    	html+="</div>";
                    	html+="<div class=\"row2\">"+content+"</div>";
    					html+="<div class=\"row3\">";
    					html+="<div class=\"time\">--"+time+"--</div>";
    					html+="<div class=\"reply\" >";
    					html+="<a href=\"#\" onclick=\"replyDiv(this)\">回复</a>";
    					html+="</div>";
    					html+="</div>";
    					html+="<div class=\"row4\">";
    					html+="<div class=\"input-group\">";
    					html+="<input type=\"text\" class=\"form-control\" placeholder=\"请输入内容\">";
    					html+="<span class=\"input-group-btn\">";
    					html+="<button class=\"btn btn-success\" type=\"button\" onclick=\"send(this)\">发送</button>";
    					html+="</span>";
    					html+="</div>";
    					html+="</div>";
    					html+="</div>";
                    	$('#container').append(html);
                    	$(obj).parents('.row4').hide();
                    }  
                });
			}
			
		}
	</script>
  </div>
</body>

</html>
