event handling
mouseUp: evt
	"The mouse came up in the receiver; If the mouse is still within the receiver at this point, do the corresponding action"

	| aColor |
	(aColor := self valueOfProperty: #oldColor) ifNotNil: [self color: aColor].
	(self containsPoint: evt cursorPoint)
		ifTrue: [self doButtonAction].
	super mouseUp: evt "send to evt handler if any"
