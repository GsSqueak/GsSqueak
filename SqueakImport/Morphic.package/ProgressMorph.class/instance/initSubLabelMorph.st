initialization
initSubLabelMorph
	^ subLabelMorph := (StringMorph contents: '')
		font: ((UserInterfaceTheme current get: #font for: PluggableButtonMorph) ifNil: [TextStyle defaultFont]);
		color: ((UserInterfaceTheme current get: #textColor for: PluggableButtonMorph) ifNil: [Color black]);
		yourself