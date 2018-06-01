accessing
decimalPlaces
	"Answer the number of decimal places to show."

	| places |
	(places := self valueOfProperty: #decimalPlaces) ifNotNil: [^ places].
	self setProperty: #decimalPlaces toValue: (places := Utilities decimalPlacesForFloatPrecision: self floatPrecision).
	^ places