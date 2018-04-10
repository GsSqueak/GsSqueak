-Etoys-geometry
referencePositionInWorld: aPoint 
	| _gsSqueakTemp_localPosition |
	_gsSqueakTemp_localPosition := owner
				ifNil: [aPoint]
				ifNotNil: [(owner transformFrom: self world)
						globalPointToLocal: aPoint].
	self referencePosition: _gsSqueakTemp_localPosition