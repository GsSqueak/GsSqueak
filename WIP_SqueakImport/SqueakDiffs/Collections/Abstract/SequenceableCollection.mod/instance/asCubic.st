*Morphic-NewCurves-cubic support
asCubic
	"Convert this point array to a Cubic object"
	self
		assert: [self size = 4].
	self
		assert: [self
				allSatisfy: [:each | each isPoint]].
	^ Cubic withAll: self