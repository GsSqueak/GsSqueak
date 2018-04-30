transforming
rotateBy: direction centerAt: aPoint
	"Return a copy rotated #right, #left, or #pi about aPoint"
	| futureOrigin futureCorner |
	direction == #pi
		ifTrue:
			[futureOrigin := self corner.
			futureCorner := self origin]
		ifFalse: [direction == #left
			ifTrue:
				[futureOrigin := self topRight.
				futureCorner := self bottomLeft]
			ifFalse: [direction == #right
				ifTrue:
					[futureOrigin := self bottomLeft.
					futureCorner := self topRight]
				ifFalse: [self error: 'unrecognizable direction']]].
	^ (futureOrigin rotateBy: direction centerAt: aPoint)
		corner: (futureCorner rotateBy: direction centerAt: aPoint)