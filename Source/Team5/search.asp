<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/CONNECT.asp" -->
<%
Dim rsGame__MMColParam
rsGame__MMColParam = "1"
If (Request.QueryString("name") <> "") Then 
  rsGame__MMColParam = Request.QueryString("name")
End If
%>
<%
Dim rsGame
Dim rsGame_cmd
Dim rsGame_numRows

Set rsGame_cmd = Server.CreateObject ("ADODB.Command")
rsGame_cmd.ActiveConnection = MM_CONNECT_STRING
rsGame_cmd.CommandText = "SELECT * FROM dbo.Game WHERE GameTitle LIKE ? AND Status = 1" 
rsGame_cmd.Prepared = true
rsGame_cmd.Parameters.Append rsGame_cmd.CreateParameter("param1", 200, 1, 200, "%" + rsGame__MMColParam + "%") ' adVarChar

Set rsGame = rsGame_cmd.Execute
rsGame_numRows = 0
%>
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = 16
Repeat1__index = 0
rsGame_numRows = rsGame_numRows + Repeat1__numRows
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
'  *** Recordset Stats, Move To Record, and Go To Record: declare stats variables

Dim rsGame_total
Dim rsGame_first
Dim rsGame_last

' set the record count
rsGame_total = rsGame.RecordCount

' set the number of rows displayed on this page
If (rsGame_numRows < 0) Then
  rsGame_numRows = rsGame_total
Elseif (rsGame_numRows = 0) Then
  rsGame_numRows = 1
End If

' set the first and last displayed record
rsGame_first = 1
rsGame_last  = rsGame_first + rsGame_numRows - 1

' if we have the correct record count, check the other stats
If (rsGame_total <> -1) Then
  If (rsGame_first > rsGame_total) Then
    rsGame_first = rsGame_total
  End If
  If (rsGame_last > rsGame_total) Then
    rsGame_last = rsGame_total
  End If
  If (rsGame_numRows > rsGame_total) Then
    rsGame_numRows = rsGame_total
  End If
End If
%>
                          <%
Dim MM_paramName 
%>
                          <%
' *** Move To Record and Go To Record: declare variables

Dim MM_rs
Dim MM_rsCount
Dim MM_size
Dim MM_uniqueCol
Dim MM_offset
Dim MM_atTotal
Dim MM_paramIsDefined

Dim MM_param
Dim MM_index

Set MM_rs    = rsGame
MM_rsCount   = rsGame_total
MM_size      = rsGame_numRows
MM_uniqueCol = ""
MM_paramName = ""
MM_offset = 0
MM_atTotal = false
MM_paramIsDefined = false
If (MM_paramName <> "") Then
  MM_paramIsDefined = (Request.QueryString(MM_paramName) <> "")
End If
%>
                          <%
' *** Move To Record: handle 'index' or 'offset' parameter

if (Not MM_paramIsDefined And MM_rsCount <> 0) then

  ' use index parameter if defined, otherwise use offset parameter
  MM_param = Request.QueryString("index")
  If (MM_param = "") Then
    MM_param = Request.QueryString("offset")
  End If
  If (MM_param <> "") Then
    MM_offset = Int(MM_param)
  End If

  ' if we have a record count, check if we are past the end of the recordset
  If (MM_rsCount <> -1) Then
    If (MM_offset >= MM_rsCount Or MM_offset = -1) Then  ' past end or move last
      If ((MM_rsCount Mod MM_size) > 0) Then         ' last page not a full repeat region
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While ((Not MM_rs.EOF) And (MM_index < MM_offset Or MM_offset = -1))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
  If (MM_rs.EOF) Then 
    MM_offset = MM_index  ' set MM_offset to the last possible record
  End If

End If
%>
                          <%
' *** Move To Record: if we dont know the record count, check the display range

If (MM_rsCount = -1) Then

  ' walk to the end of the display range for this page
  MM_index = MM_offset
  While (Not MM_rs.EOF And (MM_size < 0 Or MM_index < MM_offset + MM_size))
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend

  ' if we walked off the end of the recordset, set MM_rsCount and MM_size
  If (MM_rs.EOF) Then
    MM_rsCount = MM_index
    If (MM_size < 0 Or MM_size > MM_rsCount) Then
      MM_size = MM_rsCount
    End If
  End If

  ' if we walked off the end, set the offset based on page size
  If (MM_rs.EOF And Not MM_paramIsDefined) Then
    If (MM_offset > MM_rsCount - MM_size Or MM_offset = -1) Then
      If ((MM_rsCount Mod MM_size) > 0) Then
        MM_offset = MM_rsCount - (MM_rsCount Mod MM_size)
      Else
        MM_offset = MM_rsCount - MM_size
      End If
    End If
  End If

  ' reset the cursor to the beginning
  If (MM_rs.CursorType > 0) Then
    MM_rs.MoveFirst
  Else
    MM_rs.Requery
  End If

  ' move the cursor to the selected record
  MM_index = 0
  While (Not MM_rs.EOF And MM_index < MM_offset)
    MM_rs.MoveNext
    MM_index = MM_index + 1
  Wend
End If
%>
                          <%
' *** Move To Record: update recordset stats

' set the first and last displayed record
rsGame_first = MM_offset + 1
rsGame_last  = MM_offset + MM_size

If (MM_rsCount <> -1) Then
  If (rsGame_first > MM_rsCount) Then
    rsGame_first = MM_rsCount
  End If
  If (rsGame_last > MM_rsCount) Then
    rsGame_last = MM_rsCount
  End If
End If

' set the boolean used by hide region to check if we are on the last record
MM_atTotal = (MM_rsCount <> -1 And MM_offset + MM_size >= MM_rsCount)
%>
                          <%
' *** Go To Record and Move To Record: create strings for maintaining URL and Form parameters

Dim MM_keepNone
Dim MM_keepURL
Dim MM_keepForm
Dim MM_keepBoth

Dim MM_removeList
Dim MM_item
Dim MM_nextItem

' create the list of parameters which should not be maintained
MM_removeList = "&index="
If (MM_paramName <> "") Then
  MM_removeList = MM_removeList & "&" & MM_paramName & "="
End If

MM_keepURL=""
MM_keepForm=""
MM_keepBoth=""
MM_keepNone=""

' add the URL parameters to the MM_keepURL string
For Each MM_item In Request.QueryString
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepURL = MM_keepURL & MM_nextItem & Server.URLencode(Request.QueryString(MM_item))
  End If
Next

' add the Form variables to the MM_keepForm string
For Each MM_item In Request.Form
  MM_nextItem = "&" & MM_item & "="
  If (InStr(1,MM_removeList,MM_nextItem,1) = 0) Then
    MM_keepForm = MM_keepForm & MM_nextItem & Server.URLencode(Request.Form(MM_item))
  End If
Next

' create the Form + URL string and remove the intial '&' from each of the strings
MM_keepBoth = MM_keepURL & MM_keepForm
If (MM_keepBoth <> "") Then 
  MM_keepBoth = Right(MM_keepBoth, Len(MM_keepBoth) - 1)
End If
If (MM_keepURL <> "")  Then
  MM_keepURL  = Right(MM_keepURL, Len(MM_keepURL) - 1)
End If
If (MM_keepForm <> "") Then
  MM_keepForm = Right(MM_keepForm, Len(MM_keepForm) - 1)
End If

' a utility function used for adding additional parameters to these strings
Function MM_joinChar(firstItem)
  If (firstItem <> "") Then
    MM_joinChar = "&"
  Else
    MM_joinChar = ""
  End If
End Function
%>
                          <%
' *** Move To Record: set the strings for the first, last, next, and previous links

Dim MM_keepMove
Dim MM_moveParam
Dim MM_moveFirst
Dim MM_moveLast
Dim MM_moveNext
Dim MM_movePrev

Dim MM_urlStr
Dim MM_paramList
Dim MM_paramIndex
Dim MM_nextParam

MM_keepMove = MM_keepBoth
MM_moveParam = "index"

' if the page has a repeated region, remove 'offset' from the maintained parameters
If (MM_size > 1) Then
  MM_moveParam = "offset"
  If (MM_keepMove <> "") Then
    MM_paramList = Split(MM_keepMove, "&")
    MM_keepMove = ""
    For MM_paramIndex = 0 To UBound(MM_paramList)
      MM_nextParam = Left(MM_paramList(MM_paramIndex), InStr(MM_paramList(MM_paramIndex),"=") - 1)
      If (StrComp(MM_nextParam,MM_moveParam,1) <> 0) Then
        MM_keepMove = MM_keepMove & "&" & MM_paramList(MM_paramIndex)
      End If
    Next
    If (MM_keepMove <> "") Then
      MM_keepMove = Right(MM_keepMove, Len(MM_keepMove) - 1)
    End If
  End If
End If

' set the strings for the move to links
If (MM_keepMove <> "") Then 
  MM_keepMove = Server.HTMLEncode(MM_keepMove) & "&"
End If

MM_urlStr = Request.ServerVariables("URL") & "?" & MM_keepMove & MM_moveParam & "="

MM_moveFirst = MM_urlStr & "0"
MM_moveLast  = MM_urlStr & "-1"
MM_moveNext  = MM_urlStr & CStr(MM_offset + MM_size)
If (MM_offset - MM_size < 0) Then
  MM_movePrev = MM_urlStr & "0"
Else
  MM_movePrev = MM_urlStr & CStr(MM_offset - MM_size)
End If
%>
<%SetLocale("vi-vn") %>
                          <header class="page-header">
                          <div class="row">
                            <div class="twelve columns">
                              <div class="table">
                                <div class="cell">
                                  <h1>Tìm kiếm : "<%=Request.QueryString("name")%>"</h1>
                                    <ul class='breadcrumbs'>
                                        <li>
                                            <a href="" title="">Trang chủ</a>
                                        </li>
                                        <li>
                                            <span>
                                                <a href="" title="">Tìm kiếm</a>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="cell">
                                </div>
                              </div>
                            </div>
                          </div>
                        </header>

						<div id="content-wrap" class="default">
                          <div class="row">
                            <div class="small-12 columns primary">
                              <div class="products cards">
                                <ul class="block-grid small-block-grid-1 medium-block-grid-3 large-block-grid-4">
                        			<% While ((Repeat1__numRows <> 0) AND (NOT rsGame.EOF)) %>
                                            	<li>
                                                  <div class="product card ">
                                                        <article class="hproduct product-1000598151 sua-nuti-iq-step-6" data-url="" data-variant-count="1">
                                                            <div class="image-wrap">
                                                                <div class="image">
                                                                    <a href="detail.asp?id=<%=(rsGame.Fields.Item("GameID").Value)%>">
																		<div class="image-helper"></div>
																		<img src="upload/<%=(rsGame.Fields.Item("GameImage").Value)%>" style="width:277px; height:277px;" >
																	</a>
                                                                </div>
                                                            </div>
                                                            <div class="details">
                                                                <header>
                                                                    <h2>
                                                                        <a href="detail.asp?id=<%=(rsGame.Fields.Item("GameID").Value)%>">
                                                                            <span class="name"><%=(rsGame.Fields.Item("GameTitle").Value)%></span>
                                                                        </a>
                                                                    </h2>
                                                                </header>
                                                                <span class="pricing">
                                                                    <span class="price"><%=FormatCurrency((rsGame.Fields.Item("GamePrice").Value),0)%></span>
                                                                </span>
                                                            </div>
                                                        </article>
                                                  </div>
												</li>
                                              <% 
												  Repeat1__index=Repeat1__index+1
												  Repeat1__numRows=Repeat1__numRows-1
												  rsGame.MoveNext()
												Wend
												%>
                                </ul>
                              </div>
                              <div class="pagination-wrap pagination-centered">
                                  <ul class="pagination">
                                        <% If MM_offset <> 0 Then %>
                                      <li class="arrow unavailable"><a href="<%=MM_movePrev%>">Prev</a>
                                        
                                      </li>
                                      <% End If ' end MM_offset <> 0 %>
                                        <% If Not MM_atTotal Then %>
                                      <li><a title="" href="<%=MM_moveNext%>">Next</a></li>
                                    <% End If ' end Not MM_atTotal %></td>
                               
                                </ul>
                              </div>
                        	</div>
                          </div>
                        </div>
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
