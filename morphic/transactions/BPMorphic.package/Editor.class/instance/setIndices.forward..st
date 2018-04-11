private
setIndices: shiftPressed forward: forward 
	"Little helper method that sets the moving and fixed indices according
	to some flags."
	| _gsSqueakTemp_indices |
	_gsSqueakTemp_indices := Dictionary new.
	(shiftPressed
			and: [self class selectionsMayShrink])
		ifTrue: [_gsSqueakTemp_indices at: #moving put: self pointIndex.
			_gsSqueakTemp_indices at: #fixed put: self markIndex]
		ifFalse: [forward
				ifTrue: [_gsSqueakTemp_indices at: #moving put: self stopIndex.
					_gsSqueakTemp_indices at: #fixed put: self startIndex]
				ifFalse: [_gsSqueakTemp_indices at: #moving put: self startIndex.
					_gsSqueakTemp_indices at: #fixed put: self stopIndex]].
	^ _gsSqueakTemp_indices