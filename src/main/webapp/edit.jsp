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
  <style type="text/css">
  .content-wrapper{
  text-align: center;
  }
  #picture_show{
  width:330px;
  height:100px;
  margin:0 auto;
  }
  .upload-container{
   display: inline-block;
  position:relative;
  float:left;
  margin-right:10px;
  background-image:url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png);
  background-repeat:no-repeat;
  width:100px;
  height:100px;
  background-size:100% 100%;
  z-index:1;
  }
  .uploadinput {
    position:relative;
    width: 100%;
    height:100%;
    top: 0;
    left: 30px;
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
	.delete {
	position: absolute;
	z-index:2;
	top: 0px;
	right: 0px;
	width: 20px;
	height: 20px;
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
		<h2 class="text-center text-uppercase text-secondary mb-0">诊断记录修改</h2>
		<hr class="star-dark mb-5">
   		<form id="appointform" method="post" action="editPhoto" enctype="multipart/form-data">
	   		<input name="pic_path1" id="position1" value="${pic_path1}" type="text" style="display:none;">
	   		<input name="pic_path2" id="position2" value="${pic_path2}" type="text" style="display:none;">
	   		<input name="pic_path3" id="position3" value="${pic_path3}" type="text" style="display:none;">
   			<div id="picture_show" data-picnum="${picnum}" data-picpos=[1,2,3] data-sign=[0,0,0]>
    				<input id="picnum" value="" name="picnum" style="display:none;"/>
    				<input id="picpos" value="" name="picpos" style="display:none;"/>
		   		<input id="sign" value="" name="sign" style="display:none;">
    				
				<div class="upload-container" id="upload-container1" href="javascript:void(0);">
					<input id="uploadinput1" class="uploadinput" type="file" name="file1" value="file" onchange="imgPreview(this,1)">
					<a href="#" onclick="deletepic(1)"><img id="delete1" src="<%= request.getContextPath() %>/staticfile/img/delete.png" class="delete" /></a>
				</div>
				<div class="upload-container" id="upload-container2" href="javascript:void(0);">
					<input id="uploadinput2" class="uploadinput" type="file" name="file2" value="file" onchange="imgPreview(this,2)">
					<a href="#" onclick="deletepic(2)"><img id="delete2" src="<%= request.getContextPath() %>/staticfile/img/delete.png" class="delete" /></a>
				</div>
				<div class="upload-container" id="upload-container3" href="javascript:void(0);">
					<input id="uploadinput3" class="uploadinput" type="file" name="file3" value="file" onchange="imgPreview(this,3)">
					<a href="#" onclick="deletepic(3)"><img id="delete3" src="<%= request.getContextPath() %>/staticfile/img/delete.png" class="delete" /></a>
				</div>
			</div>
		<div class="form-group">
			<label>拍摄日期：</label>
			<input name="date" type="date" value="${date}"/>
		</div>
		<div class="form-group">
		<label>时间段：</label>
		<select name = "time">
  			<option value ="0" <s:if test="#request.time==0">selected</s:if>>上午</option>
 			<option value ="1" <s:if test="#request.time==1">selected</s:if>>中午</option>
 			<option value="2" <s:if test="#request.time==2">selected</s:if>>晚上</option>
		</select>
		</div>
		<input type="button" value="确定" class="btn btn-primary mybtn" onclick = "checkSubmit();" />
		
	</form>
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
	<script src="<%= request.getContextPath() %>/staticfile/js/notice.js"></script>
<script type="text/javascript">
	$(document).ready(function() { 
		
		var picshow = $('#picture_show');
	    var picnum = picshow.data('picnum');
	    var sign = picshow.data('sign');
	    alert(picnum);
	    
		var pos1 = $("#position1").val();
		var pos2 = $("#position2").val();
		var pos3 = $("#position3").val();
		var container1 =  $("#upload-container1");
		var container2 =  $("#upload-container2");
		var container3 =  $("#upload-container3");
		
		container1.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
		container2.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
		container3.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
		
		if(picnum == 3){
			container1.css("background-image","url(/shetai/shetai_image/"+pos1+")");
			container2.css("background-image","url(/shetai/shetai_image/"+pos2+")");
			container3.css("background-image","url(/shetai/shetai_image/"+pos3+")");
		}
		else if(picnum ==2){
			container1.css("background-image","url(/shetai/shetai_image/"+pos1+")");
			container2.css("background-image","url(/shetai/shetai_image/"+pos2+")");
			$("#delete3").css("display","none");
			sign[2]=1;
		}
		else if(picnum == 1){
			container1.css("background-image","url(/shetai/shetai_image/"+pos1+")");
			$("#delete2").css("display","none");
			$("#delete3").css("display","none");
			container3.css("display","none");
			sign[2]=1;
			sign[1]=1;
		}
		else{
			
		}
		
	}); 
	 function deletepic(num){
		  var pos = 0;
		  var picshow = $('#picture_show');
	      var picpos = picshow.data('picpos');
	      var picnum = picshow.data('picnum');
	      var sign = picshow.data('sign');
	      sign[num-1] = 1;
          picshow.data('sign',sign);
          alert("picsign:   "+sign);

	      for(i=0;i<picpos.length;i++){
	    	  	if(num==picpos[i]){
	    	  		pos=i;
	    	  	}
	      }
	      var temp = picpos[pos];
	      
		  for(i=pos;i<picpos.length-1;i++){
			  picpos[i]=picpos[i+1];
		  }
		  picpos[picpos.length-1]=temp;
		  picnum = picnum-1;
		  
		  picshow.data('picpos',picpos);
		  picshow.data('picnum',picnum);
		  
		  if(pos==0){
			  changeDiv(0,num);
		  }
		  else if(pos==1){
			  changeDiv(1,num);
		  }
		  else if(pos==2){
			  changeDiv(2,num);
		  }
		  else{
			  
		  }
	  }
	  function changeDiv(pos,num){
		  var picshow = $('#picture_show');
		  var $divs = picshow.find('div');
		  var firstDiv = $divs.eq(0);
		  var secondDiv = $divs.eq(1);
		  var thirdDiv = $divs.eq(2);
	      var picnum = picshow.data('picnum');
	      var picpos = picshow.data('picpos');

		  if(pos==0){
		    thirdDiv.after(firstDiv);
		  	secondDiv.after(thirdDiv);
		  	
		    firstDiv.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
		  	$('#delete'+num).css("display","none");
			  if(picnum==1){
				  firstDiv.css("display","none");
		  		}
			  else if(picnum==0){
				  firstDiv.css("display","none");
			  }
			  else{}	  	
		  }
		  else if(pos==1){
		    thirdDiv.after(secondDiv);
		    
		    secondDiv.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
		  	$('#delete'+num).css("display","none");
		  	
		  	if(picnum==1){
				  secondDiv.css("display","none");
		  		}
			  else if(picnum==0){
				  
			  }
			  else{}	  
		  }
		  else if(pos==2){	
			thirdDiv.css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
			$('#delete'+num).css("display","none");
		  }
		  else{}
		}
  function	checkSubmit(){
	  var picshow = $('#picture_show');
      var picpos = picshow.data('picpos');
      var picnum = picshow.data('picnum');
      var sign = picshow.data('sign');
      
      if(picnum==0){
	   	  alert("图片不能为空！");
	   	  return;
      }
	  alert("修改成功！");
	  alert("picnum:   "+picnum);
	  alert("picpos:   "+picpos);

	  var str1="";
	  str1+=picpos[0]+','+picpos[1]+','+picpos[2];
	  var str2="";
	  str2+=sign[0]+','+sign[1]+','+sign[2];
	  $('#picnum').val(picnum);
	  $('#picpos').val(str1);
	  $('#sign').val(str2);
	  
 	  document.getElementById("appointform").submit();
  }
    function imgPreview(fileDom,num){
        //判断是否支持FileReader
        if (window.FileReader) {
            var reader = new FileReader();
        } else {
            alert("您的设备不支持图片预览功能，如需该功能请升级您的设备！");
        }
        //获取文件
        var file = fileDom.files[0];
        var imageType = /^image\//;
        //是否是图片
        if (!imageType.test(file.type)) {
            alert("请选择图片！");
            return;
        }
        //读取完成
        reader.onload = function(e) {
            //获取图片dom
            var img = document.getElementById("upload-container"+num);
            //图片路径设置为读取的图片
            img.style.backgroundImage="url("+ e.target.result +")";
            
            var picshow = $('#picture_show');
            var picpos = picshow.data('picpos');
            var sign = picshow.data('sign');
            var next_id = 0;
            var pos = 0;
            
            sign[num-1] = 2;
            picshow.data('sign',sign);
            
            alert("picsign:   "+sign);
            
            for(var i=0;i<picpos.length;i++){
	        	  	if(num==picpos[i]){
	        	  		pos=i;
	        	  	}
          	}
            if(pos!=2){
            	next_id=picpos[pos+1];
            $('#upload-container'+next_id).css("display","block");
            $('#upload-container'+next_id).css("background-image","url(<%= request.getContextPath() %>/staticfile/img/addpic_normal.png)");
            }
            else{
            	
            }
            var delete_img = document.getElementById("delete"+num);
            delete_img.style.display="block";
            
            var picnum = picshow.data('picnum');
      	    
            if(picnum!=3){
            		picnum = picnum + 1;
            		picshow.data('picnum',picnum);
            }
            else{
            	
            }
        };
        reader.readAsDataURL(file);
    }
</script>
</body>
</html>