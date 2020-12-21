
IncludeFile "Enumeration.pb"
IncludeFile "Procedure.pb"

FilePath.s = GetCurrentDirectory()

FileToLoad.s = ProgramParameter()
;Debug FileToLoad
If FileToLoad = "" 
    ResourceFile.s = OpenFileRequester("QCM Dynamic","","QCM .qcm|*.qcm",0)
    If ResourceFile = ""
      Convertion1()
    Else 
      Decodage()
    EndIf
Else
    ResourceFile.s = FileToLoad
    Decodage()
EndIf

  
 
; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 19
; EnableXP