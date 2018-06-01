accessing
decimalPlaces: aNumber 
	"Set the receiver's number of decimal places to be shown. If my target
	is a morph or a player, tell it about the change, in case it wants to
	remember it."
	| _gsSqueakTemp_constrained |
	self setProperty: #decimalPlaces toValue: (_gsSqueakTemp_constrained := aNumber min: 11).
	self
		pvtFloatPrecision: (Utilities floatPrecisionForDecimalPlaces: _gsSqueakTemp_constrained).
	(target isMorph
			or: [target isPlayer])
		ifTrue: [target noteDecimalPlaces: _gsSqueakTemp_constrained forGetter: getSelector]