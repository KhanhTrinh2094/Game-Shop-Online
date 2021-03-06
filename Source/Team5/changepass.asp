<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/CONNECT.asp" -->
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers=""
MM_authFailedURL="login.asp"
MM_grantAccess=false
If Session("MM_Username") <> "" Then
  If (true Or CStr(Session("MM_UserAuthorization"))="") Or _
         (InStr(1,MM_authorizedUsers,Session("MM_UserAuthorization"))>=1) Then
    MM_grantAccess = true
  End If
End If
If Not MM_grantAccess Then
  MM_qsChar = "?"
  If (InStr(1,MM_authFailedURL,"?") >= 1) Then MM_qsChar = "&"
  MM_referrer = Request.ServerVariables("URL")
  if (Len(Request.QueryString()) > 0) Then MM_referrer = MM_referrer & "?" & Request.QueryString()
  MM_authFailedURL = MM_authFailedURL & MM_qsChar & "accessdenied=" & Server.URLEncode(MM_referrer)
  Response.Redirect(MM_authFailedURL)
End If
%>
<%
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
' IIf implementation
Function MM_IIf(condition, ifTrue, ifFalse)
  If condition = "" Then
    MM_IIf = ifFalse
  Else
    MM_IIf = ifTrue
  End If
End Function
%>
<%
If (CStr(Request("MM_update")) = "form1") Then
  If (Not MM_abortEdit) Then
	Dim rsPassword
	Dim rsPassword_cmd
	Dim rsPassword_numRows
	
	Set rsPassword_cmd = Server.CreateObject ("ADODB.Command")
	rsPassword_cmd.ActiveConnection = MM_CONNECT_STRING
	rsPassword_cmd.CommandText = "SELECT * FROM dbo.Member WHERE MemberID = ? AND Password = ?" 
	rsPassword_cmd.Prepared = true
	rsPassword_cmd.Parameters.Append rsPassword_cmd.CreateParameter("param1", 5, 1, -1, Session("MM_MemberID")) ' adDouble
	rsPassword_cmd.Parameters.Append rsPassword_cmd.CreateParameter("param2", 202, 1, 30, Request.Form("current")) ' adDouble
	
	Set rsPassword = rsPassword_cmd.Execute
	rsPassword_numRows = 0
	If rsPassword.EOF then
		Response.Redirect("changepass.asp?error=pass")
	End if
	
    ' execute the update
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_CONNECT_STRING
    MM_editCmd.CommandText = "UPDATE dbo.Member SET Password = ? WHERE MemberID = ?" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 201, 1, 30, Request.Form("newpass")) ' adLongVarChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, MM_IIF(Request.Form("MM_recordId"), Request.Form("MM_recordId"), null)) ' adDouble
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "profile.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
<%
Dim rsMember__MMColParam
rsMember__MMColParam = "1"
If (Session("MM_MemberID") <> "") Then 
  rsMember__MMColParam = Session("MM_MemberID")
End If
%>
<%
Dim rsMember
Dim rsMember_cmd
Dim rsMember_numRows

Set rsMember_cmd = Server.CreateObject ("ADODB.Command")
rsMember_cmd.ActiveConnection = MM_CONNECT_STRING
rsMember_cmd.CommandText = "SELECT * FROM dbo.Member WHERE MemberID = ?" 
rsMember_cmd.Prepared = true
rsMember_cmd.Parameters.Append rsMember_cmd.CreateParameter("param1", 5, 1, -1, rsMember__MMColParam) ' adDouble

Set rsMember = rsMember_cmd.Execute
rsMember_numRows = 0
%>
<!DOCTYPE html>
<html class="js flexbox flexboxlegacy canvas canvastext webgl touch geolocation postmessage websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths"><!-- InstanceBegin template="/Templates/Users.dwt.asp" codeOutsideHTMLIsLocked="false" -->
	  <head>
		  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		  <meta charset="utf-8" />
		  <title>GAME PROJECT TEAM 5</title>
  
		  <meta name="viewport" content="width=device-width, initial-scale=1" />
		  <link rel="shortcut icon" href="<%=USER_TEMPLATE%>/images/favicon.png" />
		  <link href="<%=USER_TEMPLATE%>/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
		  <link href="<%=USER_TEMPLATE%>/css/vendor.min.css" rel="stylesheet" type="text/css" media="all" />
		  <link href="<%=USER_TEMPLATE%>/css/app-base.min.css" rel="stylesheet" type="text/css" media="all" />
		  <link href="<%=USER_TEMPLATE%>/css/app-settings.scss.css" rel="stylesheet" type="text/css" media="all" />
          
		  <script src="<%=USER_TEMPLATE%>/js/modernizr.min.js" type="text/javascript"></script>
		  <script src="<%=USER_TEMPLATE%>/js/jquery.min.1.11.0.js"></script>
		  <script src="<%=USER_TEMPLATE%>/js/bootstrap.min.js"></script>
		  <script src="<%=USER_TEMPLATE%>/js/api.jquery.js" type="text/javascript"></script>
		  <script src="<%=USER_TEMPLATE%>/js/owl.carousel.min.js" type="text/javascript"></script>
		  <link href="<%=USER_TEMPLATE%>/css/owl.carousel.css" rel="stylesheet" type="text/css" media="all" />
		  <script src="<%=USER_TEMPLATE%>/js/common.js" type="text/javascript"></script>
		  <style>
			  #cartform a{
				  color: green !important;
			  }
			  .next,.prev{
				  cursor:pointer;
  
				  z-index:10000;
			  }
			  #owl-demo .item{
  
				  margin: 5px;
				  color: #FFF;
				  -webkit-border-radius: 3px;
				  -moz-border-radius: 3px;
				  border-radius: 3px;
				  text-align: center;
			  }
  
		  </style>
  
		  <style type="text/css">
			  .giohangn{
				  color: rgb(33, 71, 42) !important;
				  background-color: gray;
				  padding: 10px 20px;
				  font-size: 17px;
			  }
			  .related-products{
				  margin-top:0px !important;
				  padding-top:0px !important;
  
			  }
			  ul.block-grid.small-block-grid-2.medium-block-grid-3.large-block-grid-4 li{
				  width:100% !important;
			  }
			  .related-products .details{
				  text-align:center;
			  }
			  footer#site-footer{
				  background-color: #2c343f;
			  }
		  </style>
		  <style>
			  .card:hover h2 a{
				  color:#74b6c7 !important;
			  }
  
		  </style>
	  </head>
	  <body class="index" id="milk-store">
		  <style>
			  .secondary a{
				  color:#fff !important;
			  }
			  .secondary a:hover{
				  color:#fff !important;
			  }
		  </style>
		  <!-- /#notify-bar -->
  
		  <div id="app-wrap">
			  <!-- BEGIN #header-actions -->
			  <div id="header-actions" class="show-for-medium-up">
				  <div class="row padded-h">
					  <div class="small-12 columns">
						  <div class="table">
  
							  <div class="cell">
								  <!-- Tagline -->
								  <p id="brand-tagline" class="no-margin">
									  TEAM 5 DEV
								  </p>
							  </div>
  							  <% If Session("MM_Username") = "" Then %>
							  <div class="cell">
								  <p class="no-margin">
									  <span class="cart">
										  <span class="totals">
											  <a href="register.asp" id="customer_login_link">Đăng ký</a>
										  </span>
									  </span>
									  &nbsp;<span> | </span>&nbsp;
									  <!-- Session -->
									  <span class="session">
										  <a href="login.asp" id="customer_login_link">Đăng nhập</a>
									  </span>
								  </p>
							  </div>
                              <% else %>
                              <div class="cell">
								  <p class="no-margin">
									  <span class="cart">
										  <span class="totals">
											  <a href="profile.asp" id="customer_login_link"><%=Session("MM_Username")%></a>
										  </span>
									  </span>
									  &nbsp;<span> | </span>&nbsp;
									  <!-- Session -->
									  <span class="session">
										  <a href="logout.asp" id="customer_login_link">Đăng xuất</a>
									  </span>
								  </p>
							  </div>
                              <% end if %>
							  <div class="cell">
								  <!-- Search -->
								  <div id="header-search">
									  <form class="form-search form-inline" action="search.asp">
										  <input type="text" name="name" class="search-query search replace" placeholder="Nhập nội dung cần tìm">
									  </form>
								  </div>
							  </div>
						  </div>
					  </div>
				  </div>
			  </div>
			  <!-- /#header-actions -->
			  <!-- BEGIN #site-headaer -->
			  <header id="site-header">
				  <div class="row padded-h">
					  <div class="small-12 columns">
						  <div class="table">
							  <div id="branding-wrap" class="cell">
								  <div id="brand">
									  <h1 id="brand-primary-image" title="milk store">
										  <a href="<%=HOME%>">
											  <span>project team 5</span>
											  <img src="<%=USER_TEMPLATE%>/images/logo.png" style="width:230px; height:60px;" />
										  </a>
									  </h1>
								  </div>
							  </div>
							  <div id="nav-primary-wrap" class="cell">
								  <nav class="top-bar" data-topbar="" data-options="mobile_show_parent_link: true">
									  <ul class="title-area">
										  <li class="name"></li>
										  <li class="toggle-topbar">
											  <a href=""><span>Menu</span>&nbsp;<i class="fa fa-bars"></i></a>
										  </li>
									  </ul>
									  <section class="top-bar-section">
										  <ul class="right">
											  <li class="has-form hide-for-medium-up">
												  <form action="search.asp">
													  <input type="text" name="name" class="search-query search replace" placeholder="Nhập nội dung cần tìm">
												  </form> 
											  </li>
											  <li class="nav-item active">
												  <a href="<%=HOME%>">Trang chủ</a>
											  </li>
											  <li class="nav-item has-dropdown not-click">
												  <a href="">Loại Game</a>
												  <ul class="dropdown">
													  <li class="title back js-generated">
														  <h5>
															  <a href="javascript:void(0)">Back</a>
														  </h5>
													  </li>
													  <li>
														  <a class="parent-link js-generated" href="">Loại Game</a>
													  </li>
														<%
Dim rsCategory
Dim rsCategory_cmd
Dim rsCategory_numRows

Set rsCategory_cmd = Server.CreateObject ("ADODB.Command")
rsCategory_cmd.ActiveConnection = MM_CONNECT_STRING
rsCategory_cmd.CommandText = "SELECT * FROM dbo.Category WHERE Status=1 ORDER BY CategoryID DESC" 
rsCategory_cmd.Prepared = true

Set rsCategory = rsCategory_cmd.Execute
rsCategory_numRows = 0
%>																																																					 														<%
                                                        While (NOT rsCategory.EOF)
                                                        %>
                                                      <li class="nav-item">
														  <a href="category.asp?id=<%=(rsCategory.Fields.Item("CategoryID").Value)%>"><%=(rsCategory.Fields.Item("CategoryName").Value)%></a>
													  </li>
                                                        <%
														  rsCategory.MoveNext()
														Wend
														If (rsCategory.CursorType > 0) Then
														  rsCategory.MoveFirst
														Else
														  rsCategory.Requery
														End If
														%>
												  </ul>
											  </li>
											  <li class="nav-item">
												  <a href="news.asp">Tin tức</a>
											  </li>
											  <li class="nav-item">
												  <a href="aboutus.asp">Giới thiệu</a>
											  </li>
											  <li class="nav-item last">
												  <a href="feedback.asp">Liên hệ</a>
											  </li>
										  </ul>
									  </section>
								  </nav>
							  </div>
						  </div>
					  </div>
				  </div>
			  </header>
			  <!-- /#site-header -->
  
			  <div id="site-body">
				  <div class="row padded-h">
					  <div class="small-12 columns">
  
						  <!-- BEGIN #content-wrap -->
						  <!-- InstanceBeginEditable name="Content" -->
                          <%
						  If Request.QueryString("error") <> "" then
						  	Response.Write("<script type='text/javascript'>alert('Mật khẩu cũ không chính xác');window.location = 'changepass.asp'</script>")
							
						  end if
						  
						  %>
						<style>
                            .form-actions a{
                            color:#74b6c7 !important;
                            }
                            .form-actions a:hover{
                            color:#e45f87 !important;
                            }
                            .btn{
                                background-color: #74b6c7;
                                color: #fff;
                                padding: 10px 30px !important;
                                border-radius: 3px;
                                box-shadow: none;
                                border: none;
                            }
                                .btn:hover{
                                background-color:#5da3b5;
                            }
                            .errors ul li{
                                list-style: none;
                                margin-left: -15px;
                                color: red;
                            }
                        </style>
                         
						<header class="page-header">
                          <div class="row">
                            <div class="twelve columns">
                              <div class="table">
                                <div class="cell">
                                  <h1>Đổi mật khẩu</h1>
                                </div>
                                <div class="cell">
                                  <div id="page-header-actions">
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </header>
                        <div id="content-wrap" class="default">
                          <div class="row">
                            <div class="small-12 columns primary">
                                <div class="row">
                                  <div class="large-5 columns large-centered">
                                    <div id="customer-login" class="account-session-module">
                                        <div class="inner">
                                            <p class="note"></p>
                                            <form ACTION="<%=MM_editAction%>" name="form1" method='POST' onSubmit="return kt();">
                                                <fieldset>
                                                    <div class="row">
                                                      <div class="large-12 columns field">
                                                        <input type="password" name="current" placeholder ="Mật khẩu cũ">
                                                      </div>
                                                    </div>
                                                    <div class="row">
                                                      <div class="large-12 columns field">
                                                        <input type="password" name="newpass" placeholder="Mật khẩu mới">
                                                      </div>
                                                    </div>
                                                    <div class="row">
                                                      <div class="large-12 columns field">
                                                        <input type="password" name="confirmpass" placeholder="Xác nhận mật khẩu">
                                                      </div>
                                                    </div>
                                                    <div class="form-actions">
                                                        <input type="submit" class="button" value="Đổi mật khẩu" />&nbsp;&nbsp;
                                                    </div>
                                                </fieldset>
                                                <input type="hidden" name="MM_update" value="form1">
                                                <input type="hidden" name="MM_recordId" value="<%= rsMember.Fields.Item("MemberID").Value %>">
                                            </form>
                                         </div>
                        			   </div>
                          		    </div>
                        	     </div>
                              </div>
                           </div>
                        </div>
                        <script type="text/javascript">
                        	function kt(){
								var current = document.form1.current.value.trim();
								var newpass = document.form1.newpass.value.trim();
								var confirmpass = document.form1.confirmpass.value.trim();
								
								if(current.length == 0){
									alert('Mật khẩu cũ không thể bỏ trống');
									return false;
								}
								if(current.length > 30){
									alert('Mật khẩu cũ quá dài');
									return false;
								}
								if(current.length <= 3){
									alert('Mật khẩu cũ phải lớn hơn 3 kí tự');
									return false;	
								}
								
								if(newpass.length == 0){
									alert('Mật khẩu mới không thể bỏ trống');
									return false;
								}
								if(newpass.length > 30){
									alert('Mật khẩu mới quá dài');
									return false;
								}
								if(newpass.length <= 3){
									alert('Mật khẩu mới phải lớn hơn 3 kí tự');
									return false;	
								}
								
								if(confirmpass.length == 0){
									alert('Mật khẩu xác nhận không thể bỏ trống');
									return false;
								}
								if(confirmpass.length > 30){
									alert('Mật khẩu xác nhận quá dài');
									return false;
								}
								if(confirmpass.length <= 3){
									alert('Mật khẩu xác nhận phải lớn hơn 3 kí tự');
									return false;	
								}
								
								if(confirmpass != newpass){
									alert('Mật khẩu xác nhận không chính xác');
									return false;
								}
								return true;
							}
							
                        </script>
						<!-- InstanceEndEditable -->
						  <!-- /#content-wrap -->
					  </div>
				  </div>
				  <div class="footer-widgets-top"></div>
			  </div>
  
			  <aside class="footer-widgets show-for-medium-up">
				  <div class="row padded">
					  <div class="large-12 columns">
  
						  <div class="widgets">
							  <div class="row">
  
								  <div class="large-4 columns">
									  <section class="widget widget-page-content 01">
										  <div class="widget-inner">
											  <header class="widget-header">
												  <h2>GiỚI THIỆU CHUNG</h2>
											  </header>
											  <div class="page-content">
												  <p><span>Viết giới thiệu về website tại đây</span></p>
											  </div>
										  </div>
									  </section>
								  </div>
  
								  <div class="large-4 columns">
									  <section class="widget widget-articles 01">
										  <div class="widget-inner">
											  <header class="widget-header">
												  <h2>THÀNH VIÊN</h2>
											  </header>
											  <div class="page-content">
												  <p><span>Danh sách thành viên tại đây</span></p>
											  </div>
										  </div>
									  </section>
								  </div>
								  <div class="large-4 columns">
									  <section class="widget widget-newsletter 01">
										  <div class="widget-inner">
											  <header class="widget-header">
												  <h2>CHỨC NĂNG</h2>
											  </header>
											  <p>Viết giới thiệu chức năng tại đây</p>
										  </div>
									  </section>
								  </div>
							  </div>
						  </div>
					  </div>
				  </div>
			  </aside>
			  <!-- BEGIN #site-footer -->
			  <footer id="site-footer">
				  <div class="row padded-h">
					  <div class="small-12 columns">
						  <div id="payment-methods">
						  </div>
						  <div id="payment-methods">
							  <a href="" class="payment-method" title="Paypal"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-paypal.png" alt="paypal"></a />
							  <a href="" class="payment-method" title="Google checkout"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-google-checkout.png" alt="google-checkout"></a />
							  <a href="" class="payment-method" title="Visa"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-visa.png" alt="visa"></a />
							  <a href="" class="payment-method" title="Mastercard"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-mastercard.png" alt="mastercard"></a />
							  <a href="" class="payment-method" title="Maestro"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-maestro.png" alt="maestro"></a />
							  <a href="" class="payment-method" title="Cirrus"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-cirrus.png" alt="cirrus"></a />
							  <a href="" class="payment-method" title="American express"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-american-express.png" alt="american-express"></a />
							  <a href="" class="payment-method" title="Discover"><img src="<%=USER_TEMPLATE%>/images/img-icon-cc-discover.png" alt="discover"></a />
						  </div>
						  <div id="fine-print" class="text-color-quiet">
							  <!-- BEGIN #copyright -->
							  <div id="copyright">
								  Copyright © 2015 - All rights reserved.  Game Project By Team 5.
							  </div>
						  </div>
					  </div>
				  </div>
  
			  </footer>
			  <!-- /#site-footer -->
		  </div>
  
		  <p>
			<script src="<%=USER_TEMPLATE%>/js/jquery.min.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/vendor.min.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/haravan_common.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/currencies.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/jquery.currencies.min.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/option_selection.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/api.jquery.js" type="text/javascript"></script>
			<script src="<%=USER_TEMPLATE%>/js/app-base.min.js" type="text/javascript"></script>
		  </p>
	  </body>
  <!-- InstanceEnd --></html>
<%
rsMember.Close()
Set rsMember = Nothing
%>
