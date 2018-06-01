opening
withTitle: titleString for: anObject setSelector: setSelector getSelector: getSelector
	"
		(FontChooserTool 
			withTitle: 'Choose the Menu Font' 
			for: Preferences 
			setSelector: #setMenuFontTo: 
			getSelector: #standardMenuFont) open.
	"
	| instance |
	instance := self new.
	instance 
		title: titleString;
		target: anObject;
		setSelector: setSelector;
		getSelector: getSelector.
	^instance