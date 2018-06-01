accessing
rowAtLocation: aPoint 
	"Return the row at the given point or 0 if outside"
	| _gsSqueakTemp_pointInListMorphCoords |
	_gsSqueakTemp_pointInListMorphCoords := (self scroller transformFrom: self)
				transform: aPoint.
	^ self listMorph rowAtLocation: _gsSqueakTemp_pointInListMorphCoords