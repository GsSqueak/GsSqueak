drawing
drawLineToggleToTextOn: aCanvas lineColor: lineColor hasToggle: hasToggle
	"If I am not the only item in my container, draw the line between:
		- my toggle (if any) or my left edge (if no toggle)
		- and my text left edge"

	| myBounds myCenter hLineY hLineLeft |
	self isSoleItem ifTrue: [ ^self ].
	myBounds := self toggleBounds.
	myCenter := myBounds center.
	hLineY := myCenter y.
	hLineLeft := myCenter x - 1.
	"Draw line from toggle to text"
	aCanvas
		line: hLineLeft @ hLineY
		to: myBounds right + 0 @ hLineY
		width: 1
		color: lineColor