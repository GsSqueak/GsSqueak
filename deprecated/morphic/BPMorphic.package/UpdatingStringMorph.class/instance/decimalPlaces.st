accessing
decimalPlaces
	"Answer the number of decimal places to show."
	| _gsSqueakTemp_places |
	(_gsSqueakTemp_places := self valueOfProperty: #decimalPlaces)
		ifNotNil: [^ _gsSqueakTemp_places].
	self setProperty: #decimalPlaces toValue: (_gsSqueakTemp_places := Utilities decimalPlacesForFloatPrecision: self floatPrecision).
	^ _gsSqueakTemp_places