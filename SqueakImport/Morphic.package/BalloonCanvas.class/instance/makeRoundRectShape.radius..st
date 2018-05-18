private
makeRoundRectShape: aRectangle radius: radius
	"decompose a rounded rectangle into bezier form"
	| ovalDiameter rectExtent segments points endPoint seg idx offset rectOffset |
	ovalDiameter := (radius * 2) asPoint min: aRectangle extent.
	(ovalDiameter x <= 0 or: [ovalDiameter y <= 0]) ifTrue: [
		"degenerates into rectangle - just hand back four lines"
		| topLeft topRight bottomLeft bottomRight |
		topLeft := aRectangle topLeft.
		topRight := aRectangle topRight.
		bottomLeft := aRectangle bottomLeft.
		bottomRight := aRectangle bottomRight.

		points := Array new: 4 * 3.
		points at: 1 put: topLeft.
		points at: 2 put: topLeft.
		points at: 3 put: topRight.

		points at: 4 put: topRight.
		points at: 5 put: topRight.
		points at: 6 put: bottomRight.

		points at: 7 put: bottomRight.
		points at: 8 put: bottomRight.
		points at: 9 put: bottomLeft.

		points at: 10 put: bottomLeft.
		points at: 11 put: bottomLeft.
		points at: 12 put: topLeft.
		^points
	].
	rectExtent := aRectangle extent - ovalDiameter.
	rectOffset := aRectangle origin.
	segments := Bezier2Segment makeEllipseSegments: (0 @ 0 extent: ovalDiameter).
	"patch up the segments to include lines connecting the oval parts.
	we need: 8*3 points for the oval parts + 4*3 points for the connecting lines"
	points := Array new: 12 * 3.
	idx := 0.
	"Tweaked offsets to clean up curves. MAD"
	endPoint := segments last end + rectOffset + (0 @ -1).
	1 to: 8 by: 2 do: [:i |
		i = 1 ifTrue: [offset := rectOffset + (rectExtent x @ 0) + (1 @ -1)]. "top, tr"
		i = 3 ifTrue: [offset := rectOffset + rectExtent + (1 @ 1)]. "right, br"
		i = 5 ifTrue: [offset := rectOffset + (0 @ rectExtent y) + (0 @ 1)]. "bottom, bl"
		i = 7 ifTrue: [offset := rectOffset + (0 @ -1)]."left, tl"
		seg := segments at: i.
		"insert a line segment for the horizontal part of the round rect"
		points at: (idx := idx + 1) put: endPoint.
		points at: (idx := idx + 1) put: endPoint.
		points at: (idx := idx + 1) put: seg start + offset.
		"now the first half-arc"
		points at: (idx := idx + 1) put: seg start + offset.
		points at: (idx := idx + 1) put: seg via + offset.
		points at: (idx := idx + 1) put: seg end + offset.
		"the second half-arc"
		seg := segments at: i + 1.
		points at: (idx := idx + 1) put: seg start + offset.
		points at: (idx := idx + 1) put: seg via + offset.
		points at: (idx := idx + 1) put: seg end + offset.
		endPoint := seg end + offset.
	].
	^points