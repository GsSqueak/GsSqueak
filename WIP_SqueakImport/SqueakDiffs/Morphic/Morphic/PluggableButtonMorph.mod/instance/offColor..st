accessing
offColor: colorWhenOff
	"Set the fill colors to be used when this button is off."

	| cc |
	cc := colorWhenOff isTransparent ifTrue: [(Color gray: 0.9) alpha: 0.5] ifFalse: [colorWhenOff].
	self
		onColor: ((self userInterfaceTheme selectionModifier ifNil: [ [:c | c adjustBrightness: -0.2] ]) value: cc)
		offColor: cc
