colors
setStripeColorsFrom: paneColor 
	"Set the stripe color based on the given paneColor"

	labelArea ifNotNil: [labelArea color: Color transparent].
	self updateBoxesColor: paneColor.
	stripes ifNil: [^self].

	self borderColor: ((self userInterfaceTheme borderColorModifier ifNil: [ [:c | c adjustBrightness: -0.3] ])
							value: paneColor).

	self class gradientWindow
		ifTrue: [self fillStyle: (self gradientWithColor: paneColor)]
		ifFalse: [self color: paneColor].