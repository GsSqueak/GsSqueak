drawing
drawLinesToFirstChildOn: aCanvas lineColor: lineColor 
	"Draw line from me to next sibling"

	| child vLineX vLineTop vLineBottom childBounds childCenter |
	child := self firstVisibleChild.
	childBounds := child toggleBounds.
	childCenter := childBounds center.
	vLineX := childCenter x - 1.
	vLineTop := bounds bottom.
	child hasToggle
		ifTrue: [vLineBottom := childCenter y - 7]
		ifFalse: [vLineBottom := childCenter y].
	aCanvas
		line: vLineX @ vLineTop
		to: vLineX @ vLineBottom
		width: 1
		color: lineColor