layout
minHeightFrom: minHeight
	"Return the minimal extent the given bounds can be represented in"
	| height top bottom |
	top := topFraction ifNil: [0.0].
	bottom := bottomFraction ifNil: [1.0].
	height := bottom = top
		ifTrue: [0]
		ifFalse: [minHeight / (bottom - top)].
	topOffset ifNotNil:[height := height + topOffset].
	bottomOffset ifNotNil:[height := height + bottomOffset].
	^ height truncated