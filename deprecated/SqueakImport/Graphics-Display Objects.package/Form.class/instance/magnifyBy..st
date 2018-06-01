scaling, rotation
magnifyBy: scale 
	"Answer a Form created as a scaling of the receiver.
	Scale may be a Float or even a Point, and may be greater or less than 1.0."
	| effectiveScale |
	effectiveScale := scale isPoint ifTrue: [scale r] ifFalse: [scale].
	^ self magnify: self boundingBox by: scale
			smoothing: (effectiveScale < 1 ifTrue: [2] ifFalse: [1])