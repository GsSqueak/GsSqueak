target access
setDecimalPlacesFromTypeIn: typeIn 
	"The user has typed in a number as the new value of the receiver.
	Glean off decimal-places-preference from the type-in"
	| _gsSqueakTemp_decimalPointPosition _gsSqueakTemp_tail _gsSqueakTemp_places |
	(typeIn includes: $e)
		ifTrue: [^ self].
	_gsSqueakTemp_decimalPointPosition := typeIn
				indexOf: $.
				ifAbsent: [].
	_gsSqueakTemp_places := 0.
	_gsSqueakTemp_decimalPointPosition
		ifNotNil: [_gsSqueakTemp_tail := typeIn copyFrom: _gsSqueakTemp_decimalPointPosition + 1 to: typeIn size.
			[_gsSqueakTemp_places < _gsSqueakTemp_tail size
				and: [(_gsSqueakTemp_tail at: _gsSqueakTemp_places + 1) isDigit]]
				whileTrue: [_gsSqueakTemp_places := _gsSqueakTemp_places + 1]].
	self decimalPlaces: _gsSqueakTemp_places