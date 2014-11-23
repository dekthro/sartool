^!n::
WinGetActiveTitle, currentpath	; Grab last active window name (for path)
Gui, Destroy 			; Make sure there is no active GUI

Gui, Add, Edit, x62 y90 w50 h20 +Number +Limit +ToolTip vOrder,
Gui, Add, Text, x113 y92 w20 h20 +Center, -
Gui, Add, Edit, x132 y90 w260 h20 +ToolTip vDescription, Description
Gui, Add, Button, x22 y120 w90 h30 vCreate default, Create
Gui, Add, Button, x122 y120 w100 h30 vBrowse, Browse
Gui, Add, Button, x292 y120 w100 h30 vCancel, Cancel
Gui, Add, Edit, x62 y60 w330 h20 +Left +ToolTip vClient, 
Gui, Add, Text, x22 y63 w40 h20 +Left, Client
Gui, Add, Text, x22 y93 w40 h20 +Left, Order #
Gui, Add, Text, x22 y20 w370 h30 +Center, Enter Order # and brief description. Folders will be created in last active window. Leave client blank if not needed.
; Generated using SmartGUI Creator 4.0
Gui, Show, x567 y243 h173 w416, New Order
Return

CreateDir(pathtoorder)
{
  FileCreateDir, %pathtoorder%
  FileCreateDir, %pathtoorder%\Working Files
  FileCreateDir, %pathtoorder%\Working Files\Revisions
  FileCreateDir, %pathtoorder%\Proofs
  FileCreateDir, %pathtoorder%\Proofs\Revisions
  FileCreateDir, %pathtoorder%\Resources
  FileCreateDir, %pathtoorder%\Production
  Return
}

Execute(destination,ordernum,orderdesc,clientname)
{
  if (clientname ="")
  {
    orderpath = %destination%\%ordernum% - %orderdesc%  
    CreateDir(orderpath)
  }
  else
  {
    orderpath = W:\Clients\%clientname%\%ordernum% - %orderdesc%  
    CreateDir(orderpath)
  }
  Return
}

ButtonCancel:
  Gui, Destroy
  Return

ButtonBrowse:
  FileSelectFolder, currentpath,,2
    if Errorlevel
    return
  Gui, Submit, Nohide
  order1 := RegExReplace(Order, "[\\/:*?|<>""]", @)
  Execute(currentpath,order1,Description,Client)
  Gui, Destroy
  Return

ButtonCreate:
  Gui, Submit, Nohide
  order1 := RegExReplace(Order, "[\\/:*?|<>""]", @)
  Execute(currentpath,order1,Description,Client)
  Gui, Destroy
  Return