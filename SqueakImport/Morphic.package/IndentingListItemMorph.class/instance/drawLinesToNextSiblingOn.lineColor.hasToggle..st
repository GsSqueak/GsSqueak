drawing
drawLinesToNextSiblingOn: aCanvas lineColor: lineColor hasToggle: hasToggle
	| myBounds nextSibBounds vLineX myCenter vLineTop vLineBottom |
	myBounds := self toggleBounds.
	nextSibBounds := self nextVisibleSibling toggleBounds.
	myCenter := myBounds center.
	vLineX := myCenter x - 1.
	vLineTop := myCenter y.
	vLineBottom := nextSibBounds center y.
	"Draw line from me to next sibling"
	aCanvas
		line: vLineX @ vLineTop
		to: vLineX @ vLineBottom
		width: 1
		color: lineColor