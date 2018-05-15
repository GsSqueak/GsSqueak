prefs - fonts
setWindowTitleFontTo: aFont
	"Set the window-title font to be as indicated"

	UserInterfaceTheme current
		set: #windowTitleFont
		to: aFont;
		apply.

	"(Smalltalk hasClassNamed: #StandardSystemView)
		ifTrue: [(Smalltalk at: #StandardSystemView) setLabelStyle].
	(Smalltalk hasClassNamed: #Flaps)
		ifTrue: [(Smalltalk at: #Flaps) replaceToolsFlap]"
