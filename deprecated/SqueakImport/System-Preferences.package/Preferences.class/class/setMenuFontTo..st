prefs - fonts
setMenuFontTo: aFont

	UserInterfaceTheme current
		set: #standardMenuFont
		to: aFont;
		apply.
		
	"Smalltalk at: #PopUpMenu ifPresent:[:aClass| aClass setMenuFontTo: aFont].
	TheWorldMainDockingBar updateInstances."