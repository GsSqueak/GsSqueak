target access
stringForNumericValue: aValue 
	"Answer a suitably-formatted string representing the value."
	| _gsSqueakTemp_barePrintString |
	((_gsSqueakTemp_barePrintString := aValue printString) includes: $e)
		ifTrue: [^ _gsSqueakTemp_barePrintString].
	^ aValue printShowingDecimalPlaces: self decimalPlaces