<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/CONNECT.asp" -->
<%
Dim rsCategory
Dim rsCategory_cmd
Dim rsCategory_numRows

Set rsCategory_cmd = Server.CreateObject ("ADODB.Command")
rsCategory_cmd.ActiveConnection = MM_CONNECT_STRING
rsCategory_cmd.CommandText = "SELECT Count(*) as count FROM dbo.Category" 
rsCategory_cmd.Prepared = true

Set rsCategory = rsCategory_cmd.Execute
rsCategory_numRows = 0
%>
<%
Dim rsMember
Dim rsMember_cmd
Dim rsMember_numRows

Set rsMember_cmd = Server.CreateObject ("ADODB.Command")
rsMember_cmd.ActiveConnection = MM_CONNECT_STRING
rsMember_cmd.CommandText = "SELECT Count(*) as count FROM dbo.Member" 
rsMember_cmd.Prepared = true

Set rsMember = rsMember_cmd.Execute
rsMember_numRows = 0
%>
<%
Dim rsGame
Dim rsGame_cmd
Dim rsGame_numRows

Set rsGame_cmd = Server.CreateObject ("ADODB.Command")
rsGame_cmd.ActiveConnection = MM_CONNECT_STRING
rsGame_cmd.CommandText = "SELECT Count(*) as count FROM dbo.Game" 
rsGame_cmd.Prepared = true

Set rsGame = rsGame_cmd.Execute
rsGame_numRows = 0
%>
<%
Dim rsComment
Dim rsComment_cmd
Dim rsComment_numRows

Set rsComment_cmd = Server.CreateObject ("ADODB.Command")
rsComment_cmd.ActiveConnection = MM_CONNECT_STRING
rsComment_cmd.CommandText = "SELECT Count(*) as count FROM dbo.Comment" 
rsComment_cmd.Prepared = true

Set rsComment = rsComment_cmd.Execute
rsComment_numRows = 0
%>
<%
Dim rsFeedback
Dim rsFeedback_cmd
Dim rsFeedback_numRows

Set rsFeedback_cmd = Server.CreateObject ("ADODB.Command")
rsFeedback_cmd.ActiveConnection = MM_CONNECT_STRING
rsFeedback_cmd.CommandText = "SELECT Count(*) as count FROM dbo.Feedback" 
rsFeedback_cmd.Prepared = true

Set rsFeedback = rsFeedback_cmd.Execute
rsFeedback_numRows = 0
%>
<%
Dim rsNews
Dim rsNews_cmd
Dim rsNews_numRows

Set rsNews_cmd = Server.CreateObject ("ADODB.Command")
rsNews_cmd.ActiveConnection = MM_CONNECT_STRING
rsNews_cmd.CommandText = "SELECT Count(*) as count FROM dbo.News" 
rsNews_cmd.Prepared = true

Set rsNews = rsNews_cmd.Execute
rsNews_numRows = 0
%>
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers=""
MM_authFailedURL = ADMIN_HOME & "/login.asp"
MM_grantAccess=false
If Session("AD_Username") <> "" Then
  If (true Or CStr(Session("AD_UserAuthorization"))="") Or _
         (InStr(1,MM_authorizedUsers,Session("AD_UserAuthorization"))>=1) Then
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
<!DOCTYPE html>
<html lang="en"><!-- InstanceBegin template="/Templates/Admins.dwt.asp" codeOutsideHTMLIsLocked="false" -->
    <head>
        <meta charset="utf-8"/>
        <title>Game Panel</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"/>
        <link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400italic,700' rel='stylesheet' type='text/css'/>
        <link rel="shortcut icon" href="<%=ADMIN_TEMPLATE%>/images/favicon.ico" />
        <!--[if lt IE 10]>
            <script src="assets/js/media.match.min.js"></script>
            <script src="assets/js/placeholder.min.js"></script>
        <![endif]-->
        <link href="<%=ADMIN_TEMPLATE%>/fonts/font-awesome/css/font-awesome.min.css" type="text/css" rel="stylesheet" />
        <link href="<%=ADMIN_TEMPLATE%>/css/styles.css" type="text/css" rel="stylesheet" />
        <link href="<%=ADMIN_TEMPLATE%>/plugins/jstree/dist/themes/avalon/style.min.css" type="text/css" rel="stylesheet" />
        <link href="<%=ADMIN_TEMPLATE%>/plugins/codeprettifier/prettify.css" type="text/css" rel="stylesheet" />
        <link href="<%=ADMIN_TEMPLATE%>/plugins/iCheck/skins/minimal/blue.css" type="text/css" rel="stylesheet" />
        <!--[if lt IE 9]>
            <link href="assets/css/ie8.css" type="text/css" rel="stylesheet"/>
            <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/respond.js/1.1.0/respond.min.js"></script>
            <script type="text/javascript" src="assets/plugins/charts-flot/excanvas.min.js"></script>
            <script type="text/javascript" src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <link href="<%=ADMIN_TEMPLATE%>/plugins/form-daterangepicker/daterangepicker-bs3.css" type="text/css" rel="stylesheet" />    	<!-- DateRangePicker -->
        <link href="<%=ADMIN_TEMPLATE%>/plugins/switchery/switchery.css" type="text/css" rel="stylesheet" />        					<!-- Switchery -->
        <link href="<%=ADMIN_TEMPLATE%>/plugins/fullcalendar/fullcalendar.css" type="text/css" rel="stylesheet" /> 						<!-- FullCalendar -->
        <!-- Initialize scripts for this page-->
        	<!-- InstanceBeginEditable name="PageStyle" --><!-- InstanceEndEditable -->
        <!-- End loading page level scripts-->
    </head>
    <body class="infobar-offcanvas">
        <div id="headerbar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-6 col-sm-2">
                        <a href="member_manager.asp" class="shortcut-tiles tiles-brown">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-user"></i></div>
                            </div>
                            <div class="tiles-footer">
                                Member Manager
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-2">
                        <a href="game_manager.asp" class="shortcut-tiles tiles-grape">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-gamepad"></i></div>
                            </div>
                            <div class="tiles-footer">
                                Game Manager
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-2">
                        <a href="category_manager.asp" class="shortcut-tiles tiles-primary">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-flask"></i></div>
                            </div>
                            <div class="tiles-footer">
                                Category Manager
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-2">
                        <a href="comment_manager.asp" class="shortcut-tiles tiles-inverse">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-comment"></i></div>
                            </div>
                            <div class="tiles-footer">
                                Comment Manager
                            </div>
                        </a>
                    </div>

                    <div class="col-xs-6 col-sm-2">
                        <a href="feedback_manager.asp" class="shortcut-tiles tiles-midnightblue">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-envelope-o"></i></div>
                            </div>
                            <div class="tiles-footer">
                                Feedback Manager
                            </div>
                        </a>
                    </div>
                    <div class="col-xs-6 col-sm-2">
                        <a href="news_manager.asp" class="shortcut-tiles tiles-orange">
                            <div class="tiles-body">
                                <div class="pull-left"><i class="fa fa-rss-square"></i></div>
                            </div>
                            <div class="tiles-footer">
                                News Manager
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <header id="topnav" class="navbar navbar-inverse navbar-fixed-top clearfix" role="banner">


            <a id="leftmenu-trigger" class="" data-toggle="tooltip" data-placement="right" title="Toggle Sidebar"></a>
            <a class="navbar-brand" href="index-2.html">Game Panel</a>
            <ul class="nav navbar-nav toolbar pull-right">
                <li class="toolbar-icon-bg demo-headerdrop-hidden">
                    <a href="#" id="headerbardropdown"><span class="icon-bg"><i class="fa fa-fw fa-level-down"></i></span></i></a>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle username" data-toggle="dropdown">
                        <span class="hidden-xs">Admin</span>
                        <img class="img-circle" src="<%=ADMIN_TEMPLATE%>/images/admin-avartar.png" alt="Dangerfield" />
                    </a>
                    <ul class="dropdown-menu userinfo">
                        <li><a href="<%=ADMIN_HOME%>/changepass.asp"><span class="pull-left">Đổi mật khẩu</span> <i class="pull-right fa fa-pencil"></i></a></li>
                        <li><a href="<%=ADMIN_HOME%>/logout.asp"><span class="pull-left">Đăng xuất</span> <i class="pull-right fa fa-sign-out"></i></a></li>
                    </ul>
                </li>
            </ul>
        </header>

        <div id="wrapper">
            <div id="layout-static">
                <div class="static-sidebar-wrapper sidebar-default">
                    <div class="static-sidebar">
                        <div class="sidebar">
                            <div class="widget stay-on-collapse">
                                <div class="widget-body welcome-box tabular">
                                    <div class="tabular-row">
                                        <div class="tabular-cell welcome-avatar">
                                            <a href="#"><img src="<%=ADMIN_TEMPLATE%>/images/admin-avartar.png" class="avatar"></a>
                                        </div>
                                        <div class="tabular-cell welcome-options">
                                            <span class="welcome-text">Welcome, Admin</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="widget stay-on-collapse" id="widget-sidebar">
                                <span class="widget-heading">Explore</span>
                                <nav role="navigation" class="widget-body">
                                    <ul class="acc-menu">
                                        <li><a href="index.asp"><i class="fa fa-home"></i><span>Dashboard</span></a></li>
                                        <li><a href="member_manager.asp"><i class="fa fa-user"></i><span>Member Manager</span></a></li>
                                        <li><a href="game_manager.asp"><i class="fa fa-gamepad"></i><span>Game Manager</span></a></li>
                                        <li><a href="category_manager.asp"><i class="fa fa-flask"></i><span>Category Manager</span></a></li>
                                        <li><a href="comment_manager.asp"><i class="fa fa-comment"></i><span>Comment Manager</span></a></li>
                                        <li><a href="feedback_manager.asp"><i class="fa fa-envelope-o"></i><span>Feedback Manager</span></a></li>
                                        <li><a href="news_manager.asp"><i class="fa fa-rss-square"></i><span>News Manager</span></a></li>
                                        <li><a href="system_statitics.asp"><i class="fa fa-bar-chart-o"></i><span>System Statitics</span></a></li>
                                        
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="static-content-wrapper">
                    <div class="static-content">
                		<!-- InstanceBeginEditable name="Content" -->
						<div class="page-content">
                            <div class="page-heading">            
                                <h1>System Statitics</h1>
                            </div>
                            <ol class="breadcrumb">
                                <li><a href="index-2.html">Home</a></li>
                                <li><a href="#">System Statitics</a></li>
                            </ol>
                            <div class="container-fluid">
                            	<div class="row">
                                    <div class="col-sm-12">
                                        <!--<div class="alert alert-info">
                                            <p>Add member successfull</p>
                                        </div>-->
                                        <div class="panel panel-midnightblue">
                                            <div class="panel-heading">
                                                <h2>System Statitics</h2>
                                            </div>
                                            <div class="panel-body">
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="horizontal-form">
                                                        <form class="form-horizontal">
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" style="    padding-top: 0px;" >Total category : </label>
                                                                <div class="col-sm-1">
                                                                    
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <%=(rsCategory.Fields.Item("count").Value)%>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" style="    padding-top: 0px;" >Total Game : </label>
                                                                <div class="col-sm-1">
                                                                    
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <%=(rsGame.Fields.Item("count").Value)%>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" style="    padding-top: 0px;" >Total Comment : </label>
                                                                <div class="col-sm-1">
                                                                    
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <%=(rsComment.Fields.Item("count").Value)%>
                                                              </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" style="    padding-top: 0px;" >Total Feedback : </label>
                                                                <div class="col-sm-1">
                                                                    
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <%=(rsFeedback.Fields.Item("count").Value)%>
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label class="col-sm-2 control-label" style="    padding-top: 0px;" >Total News : </label>
                                                                <div class="col-sm-1">
                                                                    
                                                                </div>
                                                                <div class="col-sm-9">
                                                                    <%=(rsNews.Fields.Item("count").Value)%>
                                                                </div>
                                                            </div>
                                                        </form>
                                                    </div>
                                                </div>
                                
                                                <div class="panel-footer">
                                                    <div class="row">
                                                        <div class="col-sm-8 col-sm-offset-2">
                                                            <button class="btn-default btn">Back</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							</div>
                    	</div>	
						<!-- InstanceEndEditable -->
                    </div>
                    <footer role="contentinfo">
                        <div class="clearfix">
                            <ul class="list-unstyled list-inline pull-left">
                                <li><h6 style="margin: 0;"> &copy; 2015 Game Project Team 5</h6></li>
                            </ul>
                            <button class="pull-right btn btn-link btn-xs hidden-print" id="back-to-top"><i class="fa fa-arrow-up"></i></button>
                        </div>
                    </footer>
                </div>
            </div>
        </div>

        <!-- Switcher -->
        <div class="demo-options">
            <div class="demo-options-icon"><i class="fa fa-spin fa-fw fa-smile-o"></i></div>
            <div class="demo-heading">Admin Settings</div>

            <div class="demo-body">
                <div class="tabular">
                    <div class="tabular-row">
                        <div class="tabular-cell">Fixed Header</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="success" data-off-color="default" name="demo-fixedheader" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Boxed Layout</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-boxedlayout" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Collapse Leftbar</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" data-size="mini" data-on-color="success" data-off-color="default" name="demo-collapseleftbar" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row">
                        <div class="tabular-cell">Collapse Rightbar</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="success" data-off-color="default" name="demo-collapserightbar" data-on-text="I" data-off-text="O"></div>
                    </div>
                    <div class="tabular-row hide" id="demo-horizicon">
                        <div class="tabular-cell">Horizontal Icons</div>
                        <div class="tabular-cell demo-switches"><input class="bootstrap-switch" type="checkbox" checked data-size="mini" data-on-color="primary" data-off-color="warning" data-on-text="S" data-off-text="L" name="demo-horizicons" ></div>
                    </div>
                </div>

            </div>

            <div class="demo-body">
                <div class="option-title">Header Colors</div>
                <ul id="demo-header-color" class="demo-color-list">
                    <li><span class="demo-white"></span></li>
                    <li><span class="demo-black"></span></li>
                    <li><span class="demo-midnightblue"></span></li>
                    <li><span class="demo-primary"></span></li>
                    <li><span class="demo-info"></span></li>
                    <li><span class="demo-alizarin"></span></li>
                    <li><span class="demo-grape"></span></li>
                    <li><span class="demo-violet"></span></li>                
                    <li><span class="demo-indigo"></span></li> 
                </ul>
            </div>

            <div class="demo-body">
                <div class="option-title">Sidebar Colors</div>
                <ul id="demo-sidebar-color" class="demo-color-list">
                    <li><span class="demo-white"></span></li>
                    <li><span class="demo-black"></span></li>
                    <li><span class="demo-midnightblue"></span></li>
                    <li><span class="demo-primary"></span></li>
                    <li><span class="demo-info"></span></li>
                    <li><span class="demo-alizarin"></span></li>
                    <li><span class="demo-grape"></span></li>
                    <li><span class="demo-violet"></span></li>                
                    <li><span class="demo-indigo"></span></li> 
                </ul>
            </div>

            <div class="demo-body hide" id="demo-boxes">
                <div class="option-title">Boxed Layout Options</div>
                <ul id="demo-boxed-bg" class="demo-color-list">
                    <li><span class="pattern-brickwall"></span></li>
                    <li><span class="pattern-dark-stripes"></span></li>
                    <li><span class="pattern-rockywall"></span></li>
                    <li><span class="pattern-subtle-carbon"></span></li>
                    <li><span class="pattern-tweed"></span></li>
                    <li><span class="pattern-vertical-cloth"></span></li>
                    <li><span class="pattern-grey_wash_wall"></span></li>
                    <li><span class="pattern-pw_maze_black"></span></li>
                    <li><span class="patther-wild_oliva"></span></li>
                    <li><span class="pattern-stressed_linen"></span></li>
                    <li><span class="pattern-sos"></span></li>
                </ul>
            </div>

        </div>
        <!-- /Switcher -->
        <!-- Load site level scripts -->
        <script type='text/javascript' src='<%=ADMIN_TEMPLATE%>/js/jquery-1.10.2.min.js'></script> 							<!-- Load jQuery -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/js/jqueryui-1.9.2.min.js"></script> 							<!-- Load jQueryUI -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/js/bootstrap.min.js"></script> 								<!-- Load Bootstrap -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/jquery-slimscroll/jquery.slimscroll.js"></script> 	<!-- Slimscroll for custom scrolls -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/sparklines/jquery.sparklines.min.js"></script>  		<!-- Sparkline -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/jstree/dist/jstree.min.js"></script>  				<!-- jsTree -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/codeprettifier/prettify.js"></script> 				<!-- Code Prettifier  -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/bootstrap-switch/bootstrap-switch.js"></script> 		<!-- Swith/Toggle Button -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/bootstrap-tabdrop/js/bootstrap-tabdrop.js"></script>  <!-- Bootstrap Tabdrop -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/iCheck/icheck.min.js"></script>     					<!-- iCheck -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/js/enquire.min.js"></script> 										<!-- Enquire for Responsiveness -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/bootbox/bootbox.js"></script>					<!-- BOOTBOX -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/js/application.js"></script>
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/demo/demo.js"></script>
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/demo/demo-switcher.js"></script>
        <!-- End loading site level scripts -->

        <!-- Load page level scripts-->

        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/form-daterangepicker/daterangepicker.js"></script>     	<!-- Date Range Picker -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/form-daterangepicker/moment.min.js"></script>             <!-- Moment.js for Date Range Picker -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/powerwidgets/js/powerwidgets.js"></script> 				<!-- PowerWidgets -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/switchery/switchery.js"></script>     					<!-- Switchery -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/plugins/fullcalendar/fullcalendar.min.js"></script>   			<!-- FullCalendar -->
        <script type='text/javascript' src="<%=ADMIN_TEMPLATE%>/demo/demo-index.js"></script> 																			
        <!-- Initialize scripts for this page-->
        	<!-- InstanceBeginEditable name="PageScript" --><!-- InstanceEndEditable -->
        <!-- End loading page level scripts-->
    </body>
<!-- InstanceEnd --></html>
<%
rsCategory.Close()
Set rsCategory = Nothing
%>
<%
rsMember.Close()
Set rsMember = Nothing
%>
<%
rsGame.Close()
Set rsGame = Nothing
%>
<%
rsComment.Close()
Set rsComment = Nothing
%>
<%
rsFeedback.Close()
Set rsFeedback = Nothing
%>
<%
rsNews.Close()
Set rsNews = Nothing
%>
