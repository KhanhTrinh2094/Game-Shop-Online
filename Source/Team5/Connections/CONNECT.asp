<%
' FileName="Connection_ado_conn_string.htm"
' Type="ADO" 
' DesigntimeType="ADO"
' HTTP="false"
' Catalog=""
' Schema=""
dim HOME
dim ADMIN_HOME
dim USER_TEMPLATE
dim ADMIN_TEMPLATE
Dim MM_CONNECT_STRING

' Config Here
HOME = "http://localhost/Team5"
MM_CONNECT_STRING = "provider=SQLOLEDB; Server=localhost; Database=Team5;uid=sa; pwd=123;"

' Do not modify here
ADMIN_HOME = HOME & "/Manager"
USER_TEMPLATE = HOME & "/Templates/Users"
ADMIN_TEMPLATE = HOME & "/Templates/Admins"

%>
