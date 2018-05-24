accessing
scaleFactor
	"Answer the number representing my scaleFactor, assuming the receiver to be unflexed (if flexed, the renderer's scaleFactor is called instead"

	| qty |
	((qty := self scalePoint) isPoint) ifTrue: [^1.0].
	^qty