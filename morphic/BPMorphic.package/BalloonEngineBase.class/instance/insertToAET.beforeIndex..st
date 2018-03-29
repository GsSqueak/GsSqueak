AET processing
insertToAET: edge beforeIndex: index 
	"Insert the given edge into the AET."
	| _gsSqueakTemp_i |
	"Make sure we have space in the AET"
	(self allocateAETEntry: 1)
		ifFalse: [^ nil].
	"Insufficient space in AET"
	_gsSqueakTemp_i := self aetUsedGet - 1.
	[_gsSqueakTemp_i < index]
		whileFalse: [aetBuffer
				at: _gsSqueakTemp_i + 1
				put: (aetBuffer at: _gsSqueakTemp_i).
			_gsSqueakTemp_i := _gsSqueakTemp_i - 1].
	aetBuffer at: index put: edge.
	self aetUsedPut: self aetUsedGet + 1