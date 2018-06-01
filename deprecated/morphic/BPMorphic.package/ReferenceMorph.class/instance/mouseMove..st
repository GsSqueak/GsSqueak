event handling
mouseMove: evt 
	"The mouse moved while the butten was down in the receiver"
	| _gsSqueakTemp_aForm |
	_gsSqueakTemp_aForm := self imageForm.
	(self containsPoint: evt cursorPoint)
		ifTrue: [_gsSqueakTemp_aForm reverse displayOn: Display]
		ifFalse: [_gsSqueakTemp_aForm displayOn: Display]