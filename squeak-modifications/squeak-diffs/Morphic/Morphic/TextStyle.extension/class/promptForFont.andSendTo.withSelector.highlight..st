*Morphic-user interface
promptForFont: aPrompt andSendTo: aTarget withSelector: aSelector highlight: currentFont 
	"Morphic Only! prompt for a font and if one is provided, send it to aTarget using a 
	message with selector aSelector."
	"TextStyle promptForFont: 'Choose system font:' andSendTo: Preferences withSelector: 
	#setSystemFontTo: "
	"Derived from a method written by Robin Gibson"
	| menu currentTextStyle |
	currentTextStyle := currentFont
				ifNotNil: [currentFont textStyleName].
	menu := MenuMorph entitled: aPrompt.
	self actualTextStyles keysSortedSafely
		do: [:styleName | | subMenu | 
			subMenu := self
						fontMenuForStyle: styleName
						target: aTarget
						selector: aSelector
						highlight: currentFont.
			menu add: styleName subMenu: subMenu.
			menu lastItem
				font: ((self named: styleName)
						fontOfSize: 18).
			styleName = currentTextStyle
				ifTrue: [menu lastItem color: Color blue darker]].
	menu popUpInWorld: self currentWorld