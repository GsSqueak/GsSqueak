Nebraska support
get: aSymbol for: anEventOrHand 
	| _gsSqueakTemp_valuesForHand |
	_gsSqueakTemp_valuesForHand := self valuesForHand: anEventOrHand.
	^ _gsSqueakTemp_valuesForHand
		at: aSymbol
		ifAbsent: []