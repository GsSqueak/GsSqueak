installing
installAsDefault  "FontSetNewYork installAsDefault"
	(UIManager default confirm: 'Do you want to install
''' , self fontName , ''' as default font?')
		ifFalse: [^ self].
	self installAsTextStyle.
	"TextConstants at: #OldDefaultTextStyle put: TextStyle default."
	TextConstants at: #DefaultTextStyle put: (TextStyle named: self fontName).
	#(ListParagraph PopUpMenu StandardSystemView) do:[:className|
		Smalltalk at: className ifPresent:[:aClass| aClass initialize].
	].