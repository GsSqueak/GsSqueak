instance creation
fromHandFreehand: hand
	"Let the user draw a polygon, holding the mouse down, and ending
		by clicking within 5 of the first point..."
	| p1 poly pN opposite |
	Cursor crossHair showWhile:
		[[Sensor anyButtonPressed] whileFalse:
			[self currentWorld displayWorldSafely; runStepMethods].
		p1 := Sensor cursorPoint].
	opposite := (Display colorAt: p1) negated.
	opposite = Color transparent ifTrue: [opposite := Color red].
	(poly := LineMorph from: p1 to: p1 color: opposite width: 2) openInWorld.
	self currentWorld displayWorldSafely; runStepMethods.
	[Sensor anyButtonPressed] whileTrue:
			[pN := Sensor cursorPoint.
			(pN dist: poly vertices last) > 3 ifTrue:
				[poly setVertices: (poly vertices copyWith: pN).
				self currentWorld displayWorldSafely; runStepMethods]].
	hand position: Sensor cursorPoint.  "Done -- update hand pos"
	^ (poly setVertices: (poly vertices copyWith: p1)) delete