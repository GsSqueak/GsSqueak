combination rules
OLDtallyIntoMap: sourceWord with: destinationWord 
	"Tally pixels into the color map. Note that the source should be 
	specified = destination, in order for the proper color map checks 
	to be performed at setup.
	Note that the region is not clipped to bit boundaries, but only to the
	nearest (enclosing) word. This is because copyLoop does not do
	pre-merge masking. For accurate results, you must subtract the
	values obtained from the left and right fringes."
	| _gsSqueakTemp_mapIndex _gsSqueakTemp_pixMask _gsSqueakTemp_shiftWord |
	(cmFlags
			bitAnd: (ColorMapPresent bitOr: ColorMapIndexedPart))
			= (ColorMapPresent bitOr: ColorMapIndexedPart)
		ifFalse: [^ destinationWord"For no effect on dest"].
	destDepth < 16
		ifTrue: ["loop through all packed pixels."
			_gsSqueakTemp_pixMask := (maskTable at: destDepth)
						bitAnd: cmMask.
			_gsSqueakTemp_shiftWord := destinationWord.
			1
				to: destPPW
				do: [:i | 
					_gsSqueakTemp_mapIndex := _gsSqueakTemp_shiftWord bitAnd: _gsSqueakTemp_pixMask.
					self tallyMapAt: _gsSqueakTemp_mapIndex put: (self tallyMapAt: _gsSqueakTemp_mapIndex)
							+ 1.
					_gsSqueakTemp_shiftWord := _gsSqueakTemp_shiftWord >> destDepth].
			^ destinationWord"For no effect on dest"].
	destDepth = 16
		ifTrue: ["Two pixels Tally the right half..."
			_gsSqueakTemp_mapIndex := self
						rgbMap: (destinationWord bitAnd: 65535)
						from: 5
						to: cmBitsPerColor.
			self tallyMapAt: _gsSqueakTemp_mapIndex put: (self tallyMapAt: _gsSqueakTemp_mapIndex)
					+ 1.
			"... and then left half"
			_gsSqueakTemp_mapIndex := self
						rgbMap: destinationWord >> 16
						from: 5
						to: cmBitsPerColor.
			self tallyMapAt: _gsSqueakTemp_mapIndex put: (self tallyMapAt: _gsSqueakTemp_mapIndex)
					+ 1]
		ifFalse: ["Just one pixel."
			_gsSqueakTemp_mapIndex := self
						rgbMap: destinationWord
						from: 8
						to: cmBitsPerColor.
			self tallyMapAt: _gsSqueakTemp_mapIndex put: (self tallyMapAt: _gsSqueakTemp_mapIndex)
					+ 1].
	^ destinationWord"For no effect on dest"