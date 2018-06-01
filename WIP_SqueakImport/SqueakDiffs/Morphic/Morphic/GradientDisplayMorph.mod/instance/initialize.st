as yet unclassified
initialize
	| fill colorRamp |
	super initialize.
	"self hResizing: #spaceFill. "
	colorRamp := {0.0 -> Color green. 0.3 -> Color red. 0.7 -> Color black. 1.0 -> Color blue}.
	fill := GradientFillStyle ramp: colorRamp.
	fill origin: 0@0.
	fill direction: self bounds extent x @ 0.
	fill radial: false.
	self fillStyle: fill