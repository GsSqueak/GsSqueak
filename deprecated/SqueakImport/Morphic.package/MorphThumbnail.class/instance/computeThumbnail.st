as yet unclassified
computeThumbnail
	"Assumption on entry:
       The receiver's width represents the maximum width allowable.
       The receiver's height represents the exact height desired."

	| f scaleX scaleY |
	f := morphRepresented imageForm.
	morphRepresented fullReleaseCachedState.
	scaleY := self height / f height.  "keep height invariant"
	scaleX := ((morphRepresented width * scaleY) <= self width)
		ifTrue:
			[scaleY]  "the usual case; same scale factor, to preserve aspect ratio"
		ifFalse:
			[self width / f width].
	self form: (f magnify: f boundingBox by: (scaleX @ scaleY) smoothing: 2).
	self extent: originalForm extent