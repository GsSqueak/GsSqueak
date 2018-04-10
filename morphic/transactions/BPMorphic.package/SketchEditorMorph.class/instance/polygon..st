actions & preps
polygon: evt 
	| _gsSqueakTemp_poly |
	_gsSqueakTemp_poly := self valueOfProperty: #polygon.
	_gsSqueakTemp_poly
		ifNil: [^ self].
	evt cursorPoint > _gsSqueakTemp_poly bounds origin
		ifTrue: [_gsSqueakTemp_poly
				extent: (evt cursorPoint - _gsSqueakTemp_poly bounds origin max: 5 @ 5)]