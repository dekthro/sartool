^!n::
WinGetActiveTitle, currentpath
Gui, Destroy

Gui, Add, Edit, x12 y80 w220 h20 limit vOrder, Enter order information here
Gui, Add, Text, x12 y10 w220 h60 +Center, Enter Signvox order number`, and a brief description. The folders will be created in the last active window. If you want to browse for a specific directory`, click browse.
Gui, Add, Button, x12 y110 w50 h30 default vCreate, Create
Gui, Add, Button, x72 y110 w50 h30 vCancel, Cancel
Gui, Add, Button, x182 y110 w50 h30 vBrowse, Browse
Gui, Show, x842 y423 h155 w248, New Order Folder
return

ButtonCancel:
goto, KILL

ButtonBrowse:
FileSelectFolder, selectFolder,,2
if Errorlevel
  return
currentpath = %selectfolder%
goto, EXECUTE

ButtonCreate:

EXECUTE:
Gui, Submit
orderpath = %currentpath%\%order%

FileCreateDir, %orderpath%
FileCreateDir, %orderpath%\Working Files
FileCreateDir, %orderpath%\Working Files\Revisions
FileCreateDir, %orderpath%\Proofs
FileCreateDir, %orderpath%\Proofs\Revisions
FileCreateDir, %orderpath%\Resources
FileCreateDir, %orderpath%\Production
goto, KILL

KILL:
Gui, Destroy
return
