layout
minWidthFrom: minWidth
	"Return the minimal extent the given bounds can be represented in"
	| width left right |
	left := leftFraction ifNil: [0.0].
	right := rightFraction ifNil: [1.0].
	width := left = right
		ifTrue: [0]
		ifFalse: [minWidth / (right - left)].
	leftOffset ifNotNil:[width := width + leftOffset].
	rightOffset ifNotNil:[width := width + rightOffset].
	^width truncated