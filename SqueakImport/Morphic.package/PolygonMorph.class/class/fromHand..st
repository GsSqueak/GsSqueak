instance creation
fromHand: hand
	"Let the user draw a polygon, clicking at each vertex, and ending
		by clicking within 5 of the first point..."
	| p1 poly oldVerts pN opposite |
	Cursor crossHair showWhile:
		[[Sensor anyButtonPressed] whileFalse:
			[self currentWorld displayWorldSafely; runStepMethods].
		p1 := Sensor cursorPoint].
	opposite := (Display colorAt: p1) negated.
	opposite = Color transparent ifTrue: [opposite := Color red].
	(poly := LineMorph from: p1 to: p1 color: opposite width: 2) openInWorld.
	oldVerts := {p1}.
	self currentWorld displayWorldSafely; runStepMethods.
	
	[[Sensor anyButtonPressed] whileTrue:
		[pN := Sensor cursorPoint.
		poly setVertices: (oldVerts copyWith: pN).
		self currentWorld displayWorldSafely; runStepMethods].
	(oldVerts size > 1 and: [(pN dist: p1) < 5]) ifTrue:
		[hand position: Sensor cursorPoint.  "Done -- update hand pos"
		^ (poly setVertices: (poly vertices copyWith: p1)) delete].
	oldVerts := poly vertices.
	[Sensor anyButtonPressed] whileFalse:
		[pN := Sensor cursorPoint.
		poly setVertices: (oldVerts copyWith: pN).
		self currentWorld displayWorldSafely; runStepMethods]] repeat