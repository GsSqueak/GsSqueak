simulation
loadPointShortAt: index from: intArray 
	"Load the short value from the given index in intArray"
	| _gsSqueakTemp_long |
	_gsSqueakTemp_long := intArray at: index // 2.
	_gsSqueakTemp_long isPoint
		ifTrue: [^ (index bitAnd: 1)
					= 0
				ifTrue: [_gsSqueakTemp_long x]
				ifFalse: [_gsSqueakTemp_long y]].
	^ ((index bitAnd: 1)
			= 0
		ifTrue: [interpreterProxy halfWordHighInLong32: _gsSqueakTemp_long]
		ifFalse: [interpreterProxy halfWordLowInLong32: _gsSqueakTemp_long]) signedIntFromShort