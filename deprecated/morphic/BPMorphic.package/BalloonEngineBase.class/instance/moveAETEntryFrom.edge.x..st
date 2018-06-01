AET processing
moveAETEntryFrom: index edge: edge x: xValue 
	"The entry at index is not in the right position of the AET. 
	Move it to the left until the position is okay."
	| _gsSqueakTemp_newIndex |
	_gsSqueakTemp_newIndex := index.
	[_gsSqueakTemp_newIndex > 0
		and: [(self
				edgeXValueOf: (aetBuffer at: _gsSqueakTemp_newIndex - 1))
				> xValue]]
		whileTrue: [aetBuffer
				at: _gsSqueakTemp_newIndex
				put: (aetBuffer at: _gsSqueakTemp_newIndex - 1).
			_gsSqueakTemp_newIndex := _gsSqueakTemp_newIndex - 1].
	aetBuffer at: _gsSqueakTemp_newIndex put: edge