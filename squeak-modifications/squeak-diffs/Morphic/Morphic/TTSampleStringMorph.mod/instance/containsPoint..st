geometry testing
containsPoint: aPoint 
	"^ super containsPoint: aPoint"

	"so much faster..."

	| picker |
	(self bounds containsPoint: aPoint) ifFalse: [^false].
	picker := BalloonCanvas on: (Form extent: 1 @ 1 depth: 32).
	picker transformBy: (MatrixTransform2x3 withOffset: aPoint negated).
	self drawOn: picker.
	^(picker form bits first) ~= 0