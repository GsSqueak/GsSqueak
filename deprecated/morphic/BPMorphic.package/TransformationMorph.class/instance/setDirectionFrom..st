geometry eToy
setDirectionFrom: aPoint 
	| _gsSqueakTemp_delta _gsSqueakTemp_degrees _gsSqueakTemp_inner |
	_gsSqueakTemp_inner := self renderedMorph.
	_gsSqueakTemp_inner == self
		ifTrue: [^ self].
	_gsSqueakTemp_delta := (_gsSqueakTemp_inner transformFromWorld globalPointToLocal: aPoint)
				- _gsSqueakTemp_inner referencePosition.
	_gsSqueakTemp_degrees := _gsSqueakTemp_delta degrees + 90.0.
	self forwardDirection: (_gsSqueakTemp_degrees \\ 360) rounded