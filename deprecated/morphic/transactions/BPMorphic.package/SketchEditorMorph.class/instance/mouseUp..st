event handling
mouseUp: evt 
	"Do nothing except those that work on mouseUp."
	| _gsSqueakTemp_myAction |
	_gsSqueakTemp_myAction := self getActionFor: evt.
	_gsSqueakTemp_myAction == #fill:
		ifTrue: [self perform: _gsSqueakTemp_myAction with: evt].
	_gsSqueakTemp_myAction == #pickup:
		ifTrue: [self pickupMouseUp: evt].
	_gsSqueakTemp_myAction == #polygon:
		ifTrue: [self polyEdit: evt].
	"a mode lets you drag vertices"
	self
		set: #lastEvent
		for: evt
		to: nil