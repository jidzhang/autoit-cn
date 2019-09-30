#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <WinAPIFiles.au3>

Example()

Func Example()
	; Create a constant variable in Local scope of the filepath that will be read/written to.
	Local Const $sFilePath = _WinAPI_GetTempFileName(@TempDir)

	; Create a temporary file to read data from.
	If Not FileWrite($sFilePath, "This is an example of using FileReadLine.") Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred whilst writing the temporary file.")
		Return False
	EndIf

	; Open the file for reading and store the handle to a variable.
	Local $hFileOpen = FileOpen($sFilePath, $FO_READ)
	If $hFileOpen = -1 Then
		MsgBox($MB_SYSTEMMODAL, "", "An error occurred when reading the file.")
		Return False
	EndIf

	; Read the fist line of the file using the handle returned by FileOpen.
	Local $sFileRead = FileReadLine($hFileOpen, 1)

	; Close the handle returned by FileOpen.
	FileClose($hFileOpen)

	; Display the first line of the file.
	MsgBox($MB_SYSTEMMODAL, "", "First line of the file:" & @CRLF & $sFileRead)

	; Delete the temporary file.
	FileDelete($sFilePath)
EndFunc   ;==>Example
