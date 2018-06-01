drawing-rectangles
fillRoundRect: aRectangle radius: radius fillStyle: fillStyle
	| points |
	radius asPoint <= (0@0) 
		ifTrue:[^self fillRectangle: aRectangle fillStyle: fillStyle].
	(radius * 2) asPoint >= aRectangle extent 
		ifTrue:[^self fillOval: aRectangle fillStyle: fillStyle].
	"decompose aRectangle into bezier form"
	points := self makeRoundRectShape: aRectangle radius: radius.
	"blast the bezier shape out"
	self
		drawBezierShape: points
		color: fillStyle
		borderWidth: 0
		borderColor: nil.
