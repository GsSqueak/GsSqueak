-Etoys-geometry
setDirectionFrom: aPoint 
	| _gsSqueakTemp_delta _gsSqueakTemp_degrees |
	_gsSqueakTemp_delta := (self transformFromWorld globalPointToLocal: aPoint)
				- self referencePosition.
	_gsSqueakTemp_degrees := _gsSqueakTemp_delta degrees + 90.0.
	self forwardDirection: (_gsSqueakTemp_degrees \\ 360) rounded