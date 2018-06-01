as yet unclassified
computeThumbnail
	| f scale |
	self objectsInMemory.
	f := page imageForm.
	scale := (self height / f height).  "keep height invariant"
"(Sensor shiftPressed) ifTrue: [scale := scale * 1.4]."
	self form: (f magnify: f boundingBox by: scale@scale smoothing: 2).

