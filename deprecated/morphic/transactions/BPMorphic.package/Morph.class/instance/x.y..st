-Etoys-geometry
x: xCoord y: yCoord 
	| _gsSqueakTemp_aWorld _gsSqueakTemp_xyOffset _gsSqueakTemp_delta |
	(_gsSqueakTemp_aWorld := self world)
		ifNil: [^ self position: xCoord @ yCoord].
	_gsSqueakTemp_xyOffset := self topLeft - self referencePosition.
	_gsSqueakTemp_delta := self referencePlayfield
				ifNil: [xCoord @ (_gsSqueakTemp_aWorld bottom - yCoord)]
				ifNotNil: [:_gsSqueakTemp_aPlayfield | _gsSqueakTemp_aPlayfield cartesianOrigin + (xCoord @ yCoord negated)].
	self position: _gsSqueakTemp_xyOffset + _gsSqueakTemp_delta