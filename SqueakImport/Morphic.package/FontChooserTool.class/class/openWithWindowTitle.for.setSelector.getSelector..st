opening
openWithWindowTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector
	"
		FontChooserTool 
			openWithWindowTitle: 'Choose the Menu Font' 
			for: Preferences 
			setSelector: #setMenuFontTo: 
			getSelector: #standardMenuFont.
	"
	^(self withTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector) open