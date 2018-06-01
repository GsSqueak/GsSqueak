event handling
mouseUp: evt 
	"The mouse came up in the receiver; If the mouse is still within the
	receiver at this point, do the corresponding action"
	(self valueOfProperty: #oldColor)
		ifNotNil: [:_gsSqueakTemp_aColor | self color: _gsSqueakTemp_aColor].
	(self containsPoint: evt cursorPoint)
		ifTrue: [self doButtonAction].
	super mouseUp: evt
	"send to evt handler if any"