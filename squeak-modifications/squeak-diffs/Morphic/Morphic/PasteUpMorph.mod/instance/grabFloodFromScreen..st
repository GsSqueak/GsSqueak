world menu
grabFloodFromScreen: evt
	"Allow the user to plant a flood seed on the Display, and create a new drawing morph from the resulting region. Attach the result to the hand."
	| screenForm exterior p1 box |
	p1 := Cursor crossHair showWhile: [Sensor waitButton].
	box := Display floodFill: Color transparent at: p1.
	exterior := ((Display copy: box) makeBWForm: Color transparent) reverse.
	self world invalidRect: box; displayWorldSafely.
	(box area > (Display boundingBox area // 2))
		ifTrue: [^ UIManager default notify: 'Sorry, the region was too big'].
	(exterior deepCopy reverse anyShapeFill reverse)  "save interior bits"
		displayOn: exterior at: 0@0 rule: Form and.
	screenForm := Form fromDisplay: box.
	screenForm eraseShape: exterior.
	screenForm isAllWhite ifFalse:
		[evt hand attachMorph: (self drawingClass withForm: screenForm)]