Dim adsinfo, ThisComp, oUser
Set adsinfo = CreateObject("adsysteminfo")
Set ThisComp = GetObject("LDAP://" & adsinfo.ComputerName)
Set oUser = GetObject("LDAP://" & adsinfo.UserName)

' Write data in Active Directory
' In the Computer Department write the user name and login time
Thiscomp.put "Department", "Logged on: " + oUser.cn + " " + CStr(Now)
ThisComp.Setinfo

'In the Department field of the user account, we write the computer name and the logon time.
oUser.put "Department", "Logged on: " + ThisComp.cn + " " + CStr(Now)
oUser.Setinfo 
wscript.quit
