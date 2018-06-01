as yet unclassified
mouseMove: anEvent 
	| delta |
	target ifNil: [^ self].
	target fastFramingOn 
		ifTrue: [delta := target doFastWindowReframe: self ptName] 
		ifFalse: [
			delta := lastMouse ifNil: [0@0] ifNotNil: [anEvent cursorPoint - lastMouse].
			lastMouse := anEvent cursorPoint.
			self apply: delta.
			self bounds: (self bounds origin + delta extent: self bounds extent)].