<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/CONNECT.asp" -->
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString <> "" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername = CStr(Request.Form("txtuser"))
If MM_valUsername <> "" Then
  Dim MM_fldUserAuthorization
  Dim MM_redirectLoginSuccess
  Dim MM_redirectLoginFailed
  Dim MM_loginSQL
  Dim MM_rsUser
  Dim MM_rsUser_cmd
  
  MM_fldUserAuthorization = ""
  MM_redirectLoginSuccess = "index.asp"
  MM_redirectLoginFailed = "login.asp"

  MM_loginSQL = "SELECT Username, Password"
  If MM_fldUserAuthorization <> "" Then MM_loginSQL = MM_loginSQL & "," & MM_fldUserAuthorization
  MM_loginSQL = MM_loginSQL & " FROM dbo.Admin WHERE Username = ? AND Password = ?"
  Set MM_rsUser_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsUser_cmd.ActiveConnection = MM_CONNECT_STRING
  MM_rsUser_cmd.CommandText = MM_loginSQL
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param1", 200, 1, 20, MM_valUsername) ' adVarChar
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param2", 200, 1, 20, Request.Form("txtpass")) ' adVarChar
  MM_rsUser_cmd.Prepared = true
  Set MM_rsUser = MM_rsUser_cmd.Execute

  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
    Session("AD_Username") = MM_valUsername
    If (MM_fldUserAuthorization <> "") Then
      Session("AD_UserAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("AD_UserAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And false Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
    Response.Redirect(MM_redirectLoginSuccess)
  End If
  MM_rsUser.Close
  Response.Redirect(MM_redirectLoginFailed)
End If
If((Session("AD_Username") <> "")) Then Response.Redirect("index.asp")
%>
<!DOCTYPE html>
<html lang="en" class="coming-soon">
<head>
    <meta charset="utf-8">
    <title>Login Form</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <link rel="shortcut icon" href="<%=ADMIN_TEMPLATE%>/images/favicon.ico" />
    <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700' rel='stylesheet' type='text/css'>
    <link href="<%=ADMIN_TEMPLATE%>/plugins/iCheck/skins/minimal/blue.css" type="text/css" rel="stylesheet">
    <link href="<%=ADMIN_TEMPLATE%>/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet">
    <link href="<%=ADMIN_TEMPLATE%>/css/styles.css" type="text/css" rel="stylesheet">
    <!--[if lt IE 9]>
        <link href="<%=ADMIN_TEMPLATE%>/css/ie8.css" type="text/css" rel="stylesheet">
        <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
    <script language="javascript" type="text/javascript">
		function check_form_login()
		{
			if(document.frm_login.txtuser.value.length==0)
			{
				alert("Tên đăng nhập không được rỗng.");
				document.frm_login.txtuser.focus();
				return false;
			}
			if(document.frm_login.txtpass.value.length==0)
			{
				alert("Mật khẩu không được rỗng.");
				document.frm_login.txtpass.focus();
				return false;
			}
			return true;
		}
	</script>
    </head>

    <body class="focused-form">
		<div class="container" id="login-form">
			<a href="index-2.html"><img src="<%=ADMIN_TEMPLATE%>/img/login-logo.png" class="login-logo"></a>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading"><h2>Login Form</h2></div>
						<div class="panel-body">
							
							<form action="<%=MM_LoginAction%>" method="post" class="form-horizontal" name="frm_login" onsubmit="return check_form_login()">
								<div class="form-group">
									<div class="col-xs-12">
										<div class="input-group">							
											<span class="input-group-addon">
												<i class="fa fa-user"></i>
											</span>
											<input name="txtuser" type="text" class="form-control" placeholder="Tên đăng nhập">
										</div>
									</div>
								</div>

								<div class="form-group">
									<div class="col-xs-12">
										<div class="input-group">
											<span class="input-group-addon">
												<i class="fa fa-key"></i>
											</span>
											<input name="txtpass" type="password" class="form-control" id="exampleInputPassword1" placeholder="Mật khẩu">
										</div>
									</div>
								</div>
								<div class="panel-footer">
									<div class="clearfix">
										<a href="../index.asp" class="btn btn-default pull-left">Trang Chủ</a>
										<input type="submit" class="btn btn-primary pull-right" value="Đăng nhập" />
									</div>
								</div>

							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		<script src="<%=ADMIN_TEMPLATE%>/js/jquery-1.10.2.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/js/jqueryui-1.9.2.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/js/bootstrap.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/sparklines/jquery.sparklines.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/jstree/dist/jstree.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/codeprettifier/prettify.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/bootstrap-switch/bootstrap-switch.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/iCheck/icheck.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/js/enquire.min.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/bootbox/bootbox.js"></script>

		<script src="<%=ADMIN_TEMPLATE%>/js/application.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/demo/demo.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/demo/demo-switcher.js"></script>
		<script src="<%=ADMIN_TEMPLATE%>/plugins/simpleWeather/jquery.simpleWeather.min.js"></script> 
    </body>
</html>