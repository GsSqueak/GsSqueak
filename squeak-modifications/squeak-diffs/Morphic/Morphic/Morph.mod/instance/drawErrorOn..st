drawing
drawErrorOn: aCanvas
	"The morph (or one of its submorphs) had an error in its drawing method."
	| saneBounds |
	saneBounds := bounds rounded.
	aCanvas
		frameAndFillRectangle: saneBounds
		fillColor: Color red
		borderWidth: 1
		borderColor: Color yellow.
	aCanvas line: saneBounds topLeft to: saneBounds bottomRight width: 1 color: Color yellow.
	aCanvas line: saneBounds topRight to: saneBounds bottomLeft width: 1 color: Color yellow.