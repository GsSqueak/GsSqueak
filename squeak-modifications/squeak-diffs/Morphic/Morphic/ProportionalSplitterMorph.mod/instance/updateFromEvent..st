events
updateFromEvent: anEvent 
	| delta |
	lastMouse ifNil: [ lastMouse := anEvent position ].
	delta := splitsTopAndBottom
		ifTrue: [ 0 @ ((self normalizedY: anEvent cursorPoint y) - lastMouse y) ]
		ifFalse: [ (self normalizedX: anEvent cursorPoint x) - lastMouse x @ 0 ].
	lastMouse := splitsTopAndBottom
		ifTrue: [ lastMouse x @ (self normalizedY: anEvent cursorPoint y) ]
		ifFalse: [ (self normalizedX: anEvent cursorPoint x) @ lastMouse y ].
	self repositionBy: delta