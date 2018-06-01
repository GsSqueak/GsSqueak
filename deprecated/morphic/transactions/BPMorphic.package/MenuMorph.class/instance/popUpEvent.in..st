control
popUpEvent: evt in: aWorld 
	"Present this menu in response to the given event."
	| _gsSqueakTemp_aHand _gsSqueakTemp_aPosition |
	_gsSqueakTemp_aHand := evt
				ifNil: [ActiveHand]
				ifNotNil: [evt hand].
	_gsSqueakTemp_aPosition := _gsSqueakTemp_aHand position truncated.
	^ self
		popUpAt: _gsSqueakTemp_aPosition
		forHand: _gsSqueakTemp_aHand
		in: aWorld