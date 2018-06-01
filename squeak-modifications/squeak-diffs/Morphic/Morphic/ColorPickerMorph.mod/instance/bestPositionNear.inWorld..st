other
bestPositionNear: box inWorld: world
	| points b |
	points := #(topCenter rightCenter bottomCenter leftCenter).  "possible anchors"
	1 to: 4 do:
		[:i |  "Try the four obvious anchor points"
		b := self bounds align: (self bounds perform: (points at: i))
					with: (box perform: (points atWrap: i + 2)).
		(world viewBox containsRect: b) ifTrue:
			[^ b topLeft"  Yes, it fits"]].

	^ 20@20  "when all else fails"
