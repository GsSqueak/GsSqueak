accessing
at: index put: anInteger 
	"For simulation only"
	| _gsSqueakTemp_word |
	anInteger < 0
		ifTrue: ["word := 16r100000000 + anInteger"
			_gsSqueakTemp_word := (anInteger + 1) negated bitInvert32]
		ifFalse: [_gsSqueakTemp_word := anInteger].
	self basicAt: index put: _gsSqueakTemp_word.
	^ anInteger