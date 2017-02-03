<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
' *** Logout the current user.
MM_logoutRedirectPage = "login.asp"
Session.Contents.Remove("AD_Username")
Session.Contents.Remove("AD_UserAuthorization")
If (MM_logoutRedirectPage <> "") Then Response.Redirect(MM_logoutRedirectPage)
%>
