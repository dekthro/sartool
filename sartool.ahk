^!n::
WinGetActiveTitle, currentpath
Gui, Destroy

Gui, Add, Edit, x12 y60 w430 h20 vOrder,Enter order information here
Gui, Add, Text, x12 y20 w430 h30 +Center, Enter Signvox order number`, and a brief description. The folders will be created in the last active window. If you want to browse for a specific directory`, click browse.
Gui, Add, Button, x12 y90 w100 h30 vCreate, Create
Gui, Add, Button, x122 y90 w100 h30 vCancel, Cancel
Gui, Add, Button, x342 y90 w100 h30 vBrowse, Browse
Gui, Show, x633 y443 h138 w460, New Order Folder
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
