colors
setWindowColor: incomingColor
	| existingColor aColor |
	incomingColor ifNil: [^ self].  "it happens"
	aColor := incomingColor.
	(aColor = ColorPickerMorph perniciousBorderColor 
		or: [aColor = Color black]) ifTrue: [^ self].
	existingColor := self paneColorToUse.
	existingColor ifNil: [^ Beeper beep].
	self paneColor: aColor.
	self setStripeColorsFrom: aColor.
	self changed.