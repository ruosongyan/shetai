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
			<div style="float:left">
				<img class="img-fluid mb-5 d-block mx-auto" src="<%= request.getContextPath() %>/staticfile/img/profile.png" alt="">
			    <h2 class="text-center text-uppercase text-secondary mb-0">个人信息</h2>
		        <hr class="star-dark mb-5">
			</div>
	        <div style="float:left;width:600px;">
	        	<div class="row">
		          <div class="col-lg-8 mx-auto">
		            <!-- The form should work on most web servers, but if the form is not working you may need to configure your web server differently. -->
		            <form name="sentMessage" action="modifyInfo"  novalidate="novalidate">
		              <div class="control-group">
		                <div class="form-group floating-label-form-group controls mb-0 pb-2">
		                  <label>姓名</label>
		                  <input class="form-control" id="name" type="text" name="name" value="${name}" placeholder="姓名" required="required" data-validation-required-message="请输入你的姓名.">
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <div class="control-group">
		                <div class="form-group controls mb-0 pb-2 radio-form-group">
		                  <label>性别</label>
	                      <label class="radio-inline">
	                          <input type="radio" name="gender" id="optionsRadiosInline1" value="0" <s:if test="#request.gender==0">checked</s:if>>男
	                      </label>
	                      <label class="radio-inline">
	                          <input type="radio" name="gender" id="optionsRadiosInline2" value="1"<s:if test="#request.gender==1">checked</s:if>>女
	                      </label>
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <div class="control-group">
		                <div class="form-group floating-label-form-group controls mb-0 pb-2">
		                  <label>年龄</label>
		                  <input class="form-control" id="phone" name="age" value="${age}" type="text" placeholder="年龄" required="required" data-validation-required-message="请输入你的年龄.">
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <div class="control-group">
		                <div class="form-group floating-label-form-group controls mb-0 pb-2">
		                  <label>职业</label>
		                  <input class="form-control" id="job" name="job" value="${job}" type="text" placeholder="职业" required="required" data-validation-required-message="请输入你的职业.">
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <div class="control-group">
		                <div class="form-group floating-label-form-group controls mb-0 pb-2">
		                  <label>病史</label>
		                  <textarea class="form-control" id="message" name="medicalHistory" rows="5" placeholder="病史" required="required" data-validation-required-message="请输入你的病史."><s:property value="medicalHistory"/></textarea>
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <div class="control-group">
		                <div class="form-group floating-label-form-group controls mb-0 pb-2">
		                  <label>最近不舒服的症状</label>
		                  <textarea class="form-control" id="message" name="symptom" rows="5" placeholder="最近不舒服的症状" required="required" data-validation-required-message="请输入你的不舒服的症状."><s:property value="symptom"/></textarea>
		                  <p class="help-block text-danger"></p>
		                </div>
		              </div>
		              <br>
		              <div id="success"></div>
		              <div class="form-group">
		                <button type="submit" class="btn btn-primary btn-xl">保存</button>
		              </div>
		            </form>
		          </div>
		        </div>
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
    <script src="<%= request.getContextPath() %>/staticfile/js/notice.js"></script>

  </div>
</body>

</html>
