<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
' *** Logout the current user.
MM_logoutRedirectPage = "index.asp"
Session.Contents.Remove("MM_Username")
Session.Contents.Remove("MM_MemberID")
Session.Contents.Remove("MM_UserAuthorization")
If (MM_logoutRedirectPage <> "") Then Response.Redirect(MM_logoutRedirectPage)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>

<body>
</body>
</html>
