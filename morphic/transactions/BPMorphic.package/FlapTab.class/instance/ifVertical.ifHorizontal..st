edge
ifVertical: block1 ifHorizontal: block2 
	"Evaluate and return the value of either the first or the second block,
	depending whether I am vertically or horizontally oriented"
	^ self orientation == #vertical
		ifTrue: [block1 value]
		ifFalse: [block2 value]