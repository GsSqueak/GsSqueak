private
setDismissColor: evt with: dismissHandle 
	"Called on mouseStillDown in the dismiss handle; set the color
	appropriately. "
	| _gsSqueakTemp_colorToUse |
	evt hand obtainHalo: self.
	_gsSqueakTemp_colorToUse := (dismissHandle containsPoint: evt cursorPoint)
				ifTrue: [Color lightGray]
				ifFalse: [Color red muchLighter].
	self setColor: _gsSqueakTemp_colorToUse toHandle: dismissHandle