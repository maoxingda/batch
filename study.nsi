; Name "My first program installer"
Name "Foo & Bar" "Foo && Bar"

; !define /date MAKE_TIME "%Y-%m-%d %H-%M-%S"

Function .onInit
	DetailPrint ""
FunctionEnd

Section
	DetailPrint 2019/01/12
SectionEnd