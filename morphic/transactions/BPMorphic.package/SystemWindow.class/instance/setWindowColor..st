colors
setWindowColor: incomingColor 
	| _gsSqueakTemp_existingColor _gsSqueakTemp_aColor |
	incomingColor
		ifNil: [^ self].
	"it happens"
	_gsSqueakTemp_aColor := incomingColor.
	(_gsSqueakTemp_aColor = ColorPickerMorph perniciousBorderColor
			or: [_gsSqueakTemp_aColor = Color black])
		ifTrue: [^ self].
	_gsSqueakTemp_existingColor := self paneColorToUse.
	_gsSqueakTemp_existingColor
		ifNil: [^ Beeper beep].
	self paneColor: _gsSqueakTemp_aColor.
	self setStripeColorsFrom: _gsSqueakTemp_aColor.
	self changed