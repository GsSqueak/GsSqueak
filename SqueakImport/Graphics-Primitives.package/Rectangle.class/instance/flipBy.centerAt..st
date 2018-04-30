transforming
flipBy: direction centerAt: aPoint 
	"Return a copy flipped #vertical or #horizontal, about aPoint."
	| futureOrigin futureCorner |
	direction == #horizontal
		ifTrue:
			[futureOrigin := self topRight.
			futureCorner := self bottomLeft]
		ifFalse: [direction == #vertical
			ifTrue:
				[futureOrigin := self bottomLeft.
				futureCorner := self topRight]
			ifFalse: [self error: 'unrecognizable direction']].
	^ (futureOrigin flipBy: direction centerAt: aPoint)
		corner: (futureCorner flipBy: direction centerAt: aPoint)