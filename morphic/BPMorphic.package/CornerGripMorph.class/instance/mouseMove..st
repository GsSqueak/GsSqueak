as yet unclassified
mouseMove: anEvent 
	| _gsSqueakTemp_delta |
	target
		ifNil: [^ self].
	target fastFramingOn
		ifTrue: [_gsSqueakTemp_delta := target doFastWindowReframe: self ptName]
		ifFalse: [_gsSqueakTemp_delta := lastMouse
						ifNil: [0 @ 0]
						ifNotNil: [anEvent cursorPoint - lastMouse].
			lastMouse := anEvent cursorPoint.
			self apply: _gsSqueakTemp_delta.
			self
				bounds: (self bounds origin + _gsSqueakTemp_delta extent: self bounds extent)]