accessing
scaleToMatch: aPoint 
	| _gsSqueakTemp_scaleFactor _gsSqueakTemp_tfm _gsSqueakTemp_originalScale |
	_gsSqueakTemp_tfm := transform withScale: 1.0.
	_gsSqueakTemp_originalScale := ((_gsSqueakTemp_tfm localBoundsToGlobal: self renderedMorph fullBounds) corner
				- (_gsSqueakTemp_tfm localPointToGlobal: self renderedMorph referencePosition)) r.
	"Catch cases where the reference point is on fullBounds corner"
	_gsSqueakTemp_originalScale := _gsSqueakTemp_originalScale max: 1.0.
	_gsSqueakTemp_scaleFactor := (aPoint - self referencePosition) r / _gsSqueakTemp_originalScale.
	_gsSqueakTemp_scaleFactor := _gsSqueakTemp_scaleFactor < 1.0
				ifTrue: [_gsSqueakTemp_scaleFactor
						detentBy: 0.05
						atMultiplesOf: 0.25
						snap: false]
				ifFalse: [_gsSqueakTemp_scaleFactor
						detentBy: 0.1
						atMultiplesOf: 0.5
						snap: false].
	self
		adjustAfter: [self
				scale: ((_gsSqueakTemp_scaleFactor min: 8.0)
						max: 0.1)]