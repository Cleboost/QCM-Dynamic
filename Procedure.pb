
Global ResourceFile.s, FilePath.s,ConvertFile.s,Vrai.a,Faux.a

Procedure Decodage()
  Nbquestion.a = 1
  fin.a = 0
  Vrai = 0
  Faux = 0
    ReadFile(#FileRes,ResourceFile)  

  Repeat
    Decodages.s = ReadString(#FileRes,#PB_Ascii) ;Lecture du fichier
  Debug StringField(Decodages,1,"$")
  Debug StringField(Decodages,2,"$")
  
  If StringField(Decodages,2,"$") = "false"
    false.a = 1
    true.a = 0
  ElseIf StringField(Decodages,2,"$") = "true"
    false.a = 0
    true.a = 1
  EndIf
  
  Select MessageRequester("Question n°"+Str(Nbquestion),StringField(Decodages,1,"$"),#PB_MessageRequester_YesNo)
    Case #PB_MessageRequester_Yes : yes.a = 1 : no.a = 0
    Case #PB_MessageRequester_No : yes.a = 0 : no.a = 1
  EndSelect
  
  If no = false
    Vrai=Vrai+1
  ElseIf yes = true
    Vrai = Vrai+1
  Else
    Faux=Faux+1
  EndIf
  
  Nbquestion=Nbquestion+1
    
  Until Eof(#FileRes) = 1
      CloseFile(#FileRes) ;Fin du fichier
   MessageRequester("Fin",Str(Vrai)+" juste(s)"+Chr(10)+Str(faux)+" faux")
EndProcedure

Procedure Convertion2()
  ConvertFile.s = OpenFileRequester("QCM Dynamic","","Texte .txt|*.txt",0)
  If ConvertFile = ""
    End
  Else 
    Name.s = ReplaceString(ConvertFile,".txt",".qcm",#PB_String_NoCase)
  Debug name
    RenameFile(ConvertFile,name)
  EndIf
  End
EndProcedure

Procedure Convertion1()
  Select MessageRequester("Convertir","Veux-tu convertir un fichier en fichier QCM ?",#PB_MessageRequester_YesNo )
    Case #PB_MessageRequester_No : End
    Case #PB_MessageRequester_Yes : Convertion2()
  EndSelect
EndProcedure

; IDE Options = PureBasic 5.70 LTS (Windows - x86)
; CursorPosition = 51
; Folding = 7
; EnableXP