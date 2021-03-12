#Include Once "Afx\CPrint.inc"


 Sub LogError(sMessage as string) 
    'TODO:implement logging
    Print sMessage
end sub


 Function FormatError(sComment as string, nErr as Integer, nErl as integer, sErfn as string, sErmn as string) As String 
    Dim sResult As String = ""
    
    On Local Error GoTo FormatErrorCatch'Try

    sResult = "\r\n"
    sResult = sResult & "Comment: '" & sComment & "'\r\n"
    sResult = sResult & "Error: '" & nErr & "'\r\n"
    sResult = sResult & "Line: '" & nErl & "'\r\n"
    sResult = sResult & "Method: '" & sErfn & "'\r\n"'TODO:These are ZString and need to be converted. Until then pass constants expicitly.
    sResult = sResult & "Module: '" & sErmn & "'\r\n"
FormatErrorFinally:
    FormatError = sResult
    Exit Function
FormatErrorCatch:
    LogError("FormatError:Error:" & Err) ' just print the error number
    Goto FormatErrorFinally
End Function
