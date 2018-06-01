edge
applyEdgeFractionWithin: aBoundsRectangle 
	"Make the receiver reflect remembered edgeFraction"
	| _gsSqueakTemp_newPosition |
	edgeFraction
		ifNil: [^ self].
	self isCurrentlySolid
		ifTrue: [^ self].
	_gsSqueakTemp_newPosition := self
				ifVertical: [self left @ (self edgeFraction * (aBoundsRectangle height - self height))]
				ifHorizontal: [self edgeFraction * (aBoundsRectangle width - self width) @ self top].
	self position: aBoundsRectangle origin + _gsSqueakTemp_newPosition