attachments
nudgeForLabel: aRectangle
	"Try to move the label off me. Prefer labels on the top and right."

	| i flags nudge |
	(self bounds intersects: aRectangle) ifFalse: [^ 0 @ 0 ].
	flags := 0.
	nudge := 0 @ 0.
	i := 1.
	aRectangle lineSegmentsDo: [ :rp1 :rp2 | | rectSeg |
		rectSeg := LineSegment from: rp1 to: rp2.
		self straightLineSegmentsDo: [ :lp1 :lp2 | | polySeg int |
			polySeg := LineSegment from: lp1 to: lp2.
			int := polySeg intersectionWith: rectSeg.
			int ifNotNil: [ flags := flags bitOr: i ].
		].
		i := i * 2.
	].
	"Now flags has bitflags for which sides"
	nudge := flags caseOf: {
"no intersection"
		[ 2r0000 ] -> [ 0 @ 0 ].
"2 adjacent sides only" 
		[ 2r1001 ] -> [ 1 @ 1 ].
		[ 2r0011 ] -> [ -1 @ 1 ].
		[ 2r1100 ] -> [ 1 @ -1 ].
		[ 2r0110 ] -> [ -1 @ -1 ].
"2 opposite sides only" 
		[ 2r1010 ] -> [ 0 @ -1 ].
		[ 2r0101 ] -> [ 1 @ 0 ].
"only 1 side" 
		[ 2r1000 ] -> [ -1 @ 0 ].
		[ 2r0001 ] -> [ 0 @ -1 ].
		[ 2r0010 ] -> [ 1 @ 0 ].
		[ 2r0100 ] -> [ 0 @ 1 ].
"3 sides" 
		[ 2r1011 ] -> [ 0 @ 1 ].
		[ 2r1101 ] -> [ 1 @ 0 ].
		[ 2r1110 ] -> [ 0 @ -1 ].
		[ 2r0111 ] -> [ -1 @ 0 ].
 "all sides" 
		[ 2r1111 ] -> [ 1 @ -1 "move up and to the right" ].
	}.
	^nudge