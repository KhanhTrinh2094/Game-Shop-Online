<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/CONNECT.asp" -->
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
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_CONNECT_STRING
    MM_editCmd.CommandText = "INSERT INTO dbo.[Comment] (CommentDetail, GameID, MemberID, CommentTime) VALUES (?, ?, ?, GETDATE())" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 203, 1, 1073741823, Request.Form("detail")) ' adLongVarWChar
	MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 5, 1, -1, Request.QueryString("id")) ' adLongVarWChar
	MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param3", 5, 1, -1, Session("MM_MemberID")) ' adLongVarWChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "detail.asp"
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
Dim rsGame__MMColParam
rsGame__MMColParam = "1"
If (Request.QueryString("id") <> "") Then 
  rsGame__MMColParam = Request.QueryString("id")
End If
%>
<%
Dim rsGame
Dim rsGame_cmd
Dim rsGame_numRows

Set rsGame_cmd = Server.CreateObject ("ADODB.Command")
rsGame_cmd.ActiveConnection = MM_CONNECT_STRING
rsGame_cmd.CommandText = "SELECT * FROM dbo.Game WHERE GameID = ? And Status = 1" 
rsGame_cmd.Prepared = true
rsGame_cmd.Parameters.Append rsGame_cmd.CreateParameter("param1", 5, 1, -1, rsGame__MMColParam) ' adDouble

Set rsGame = rsGame_cmd.Execute
rsGame_numRows = 0

If rsGame.EOF Then
	Response.Redirect("index.asp")
End If
%>
<%
Dim rsComment__MMColParam
rsComment__MMColParam = "1"
If ((rsGame.Fields.Item("GameID").Value) <> "") Then 
  rsComment__MMColParam = (rsGame.Fields.Item("GameID").Value)
End If
%>
<%
Dim rsComment
Dim rsComment_cmd
Dim rsComment_numRows

Set rsComment_cmd = Server.CreateObject ("ADODB.Command")
rsComment_cmd.ActiveConnection = MM_CONNECT_STRING
rsComment_cmd.CommandText = "SELECT a.*, b.MemberName FROM dbo.Comment a JOIN Member b ON a.MemberID = b.MemberID WHERE GameID = ?" 
rsComment_cmd.Prepared = true
rsComment_cmd.Parameters.Append rsComment_cmd.CreateParameter("param1", 5, 1, -1, rsComment__MMColParam) ' adDouble

Set rsComment = rsComment_cmd.Execute
rsComment_numRows = 0
%>
<%
Dim rsRandom
Dim rsRandom_cmd
Dim rsRandom_numRows

Set rsRandom_cmd = Server.CreateObject ("ADODB.Command")
rsRandom_cmd.ActiveConnection = MM_CONNECT_STRING
rsRandom_cmd.CommandText = "Select TOP 4 * from game WHERE Status = 1 ORDER BY NEWID()" 
rsRandom_cmd.Prepared = true

Set rsRandom = rsRandom_cmd.Execute
rsRandom_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 10
Repeat1__index = 0
rsComment_numRows = rsComment_numRows + Repeat1__numRows
%>
<%
Dim Repeat2__numRows
Dim Repeat2__index

Repeat2__numRows = -1
Repeat2__index = 0
rsRandom_numRows = rsRandom_numRows + Repeat2__numRows
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
                          <%SetLocale("vi-vn") %>
                        <header class="page-header">
                          <div class="row">
                            <div class="twelve columns">
                              <div class="table">
                                <div class="cell">
                                  <h1><%=(rsGame.Fields.Item("GameTitle").Value)%></h1>
                                </div>
                                <div class="cell">
                                  <div id="page-header-actions">
                                     <ul class="breadcrumbs">
                                        <li><a href="">Trang chủ</a></li>
                                        <li>
                                            <a title="Show type" href=""><%=(rsGame.Fields.Item("GameTitle").Value)%></a>
                                        </li>
                        			</ul>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </header>
						<div id="content-wrap" class="default">
                          <div class="row">
                            <div class="small-12 columns primary">
                                <article class="hproduct product-1000598151 sua-nuti-iq-step-6 single">
                                    <div class="row">
                                        <div class="medium-6 columns">
                                            <div class="images">
												<!-- Primary image -->
                                                <div class="primary-image-wrap">
                                                    <a href="" data-title="">
                                                        <img class="primary-image" src="upload/<%=(rsGame.Fields.Item("GameImage").Value)%>" style="width: 400px; height: 400px;" />
                                                    </a>
                                                </div>
                                            </div>
											<ul style="position:relative" class="secondary-image-wrap small-block-grid-3 large-block-grid-5"></ul>
                                        </div>
                                        <div class="medium-6 columns">
                                            <div class="details">
                                                <div class="brand section">
                                                    <a title="Show vendor" href=""><%=(rsGame.Fields.Item("GameTitle").Value)%></a>
                                                </div>
                                                <div class="pricing section">
                                                    <span class="price" style="margin-right:10px; font-size:24px; font-weight:400;">Giá: <%=FormatCurrency((rsGame.Fields.Item("GamePrice").Value),0)%></span>
                                                </div>
												<div class="variants section" >
													<div class="body section">
														<%=(rsGame.Fields.Item("GameDetail").Value)%>
												  </div>
												</div>
											</div>
										</div>
									</div>
									<div class="container">
                                        <div class="row">
                                            <div class="mota" style="  width: 75%;float: left;">
                                                <div class="des"></div>
                                                <h3 style="margin-top:40px">BÌNH LUẬN</h3>
                                                <% While ((Repeat1__numRows <> 0) AND (NOT rsComment.EOF)) %>
                                                <div id="comment-<%=(rsComment.Fields.Item("CommentID").Value)%>" class="hcomment clearfix">
													<div class="row">
														<div class="small-12 columns">
															<div class="image">
																<img src="//gravatar.com/avatar/3979576bcdcbd166d005a5b225e1bc52?s=100&amp;d=mm" alt="aa" />
															</div>
															<div class="com-meta">
																<cite class="poster vcard tcd"><%=(rsComment.Fields.Item("MemberName").Value)%></cite>
																<a class="url" href="#comment-<%=(rsComment.Fields.Item("CommentID").Value)%>">
																	<span class="date"><%=(rsComment.Fields.Item("CommentTime").Value)%></span>
																</a>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="small-12 columns">
															<div class="description" style="word-wrap:break-word">
																<%=(rsComment.Fields.Item("CommentDetail").Value)%>
															</div>
														</div>
													</div>
                                                </div>
                                                <% 
												  Repeat1__index=Repeat1__index+1
												  Repeat1__numRows=Repeat1__numRows-1
												  rsComment.MoveNext()
												Wend
												%>
                                            </div>
                                        </div>
                                    </div>
                                    <% if Session("MM_MemberID") <> "" Then %>
									<div id="comment-form" class="section">
                                    <div class="row">
                                            <div class="mota" style="  width: 75%;float: left;">
										<h3>Viêt bình luận</h3>
										<div class="alert-box error" id="verification-error" style="display:none;"></div>
                                        <form ACTION="<%=MM_editAction%>" name="form1" method="POST" onSubmit="return kt();">
											<fieldset>
												<div class="row">
													<div class="large-12 columns">
														<label for="comment_body" class="inline hidden">Nội dung</label>
														<textarea class="span12" name="detail" rows="5" placeholder="Bình luận"></textarea>
													</div>
												</div>
												<div class="form-actions">
													<input type="submit" class="button" value="Gửi" />
												</div>
											</fieldset>
                                            <input type="hidden" name="MM_insert" value="form1">
                                        </form>
                            </div>
                          </div>
                          </div>
									<% end if %>
                                    </div>
                                </article>
								<section class="related-products" style="padding-top:30px !important;">
                                    <div class="row">
                                        <div class="large-12 columns">
                                            <h3>Game liên quan</h3>
                                            <div class="products cards">
                                                <ul class="block-grid small-block-grid-1 medium-block-grid-3 large-block-grid-4">
                                                <% While ((Repeat2__numRows <> 0) AND (NOT rsRandom.EOF)) %>
                                                	<li>
                                                  <div class="product card ">
                                                        <article class="hproduct product-1000598151 sua-nuti-iq-step-6" data-url="" data-variant-count="1">
                                                            <div class="image-wrap">
                                                                <div class="image">
                                                                    <a href="detail.asp?id=<%=(rsRandom.Fields.Item("GameID").Value)%>">
																		<div class="image-helper"></div>
																		<img src="upload/<%=(rsRandom.Fields.Item("GameImage").Value)%>" style="width:277px; height:277px;" >
																	</a>
                                                                </div>
                                                            </div>
                                                            <div class="details">
                                                                <header>
                                                                    <h2>
                                                                        <a href="detail.asp?id=<%=(rsRandom.Fields.Item("GameID").Value)%>">
                                                                            <span class="name"><%=(rsRandom.Fields.Item("GameTitle").Value)%></span>
                                                                        </a>
                                                                    </h2>
                                                                </header>
                                                                <span class="pricing">
                                                                    <span class="price"><%=FormatCurrency((rsRandom.Fields.Item("GamePrice").Value),0)%></span>
                                                                </span>
                                                            </div>
                                                        </article>
                                                  </div>
												</li>
                                                <% 
												  Repeat2__index=Repeat2__index+1
												  Repeat2__numRows=Repeat2__numRows-1
												  rsRandom.MoveNext()
												Wend
												%>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </section>
                            </div>
						  </div>
						</div>
                        <script type="text/javascript">
							function kt(){
								var detail = document.form1.detail.value.trim();	
								if(detail.length == 0){
									alert("Nội dung bình luận không thể bỏ trống");
									document.form1.detail.focus();
									return false;	
								}
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
rsGame.Close()
Set rsGame = Nothing
%>
<%
rsComment.Close()
Set rsComment = Nothing
%>
<%
rsRandom.Close()
Set rsRandom = Nothing
%>
