miscellaneous
oppositeCornerFrom: aCorner 
	"Answer the corner diagonally opposite to aCorner. 6/27/96 sw"
	aCorner == #topLeft
		ifTrue: [^ #bottomRight].
	aCorner == #topRight
		ifTrue: [^ #bottomLeft].
	aCorner == #bottomLeft
		ifTrue: [^ #topRight].
	^ #topLeft