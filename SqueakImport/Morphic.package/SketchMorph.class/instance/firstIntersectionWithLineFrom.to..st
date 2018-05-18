geometry
firstIntersectionWithLineFrom: start to: end
	| intersections last |
	intersections := self fullBounds extrapolatedIntersectionsWithLineFrom: start to: end.
	intersections size = 1 ifTrue: [ ^intersections anyOne ].
	intersections isEmpty ifTrue: [ ^nil ].
	intersections := intersections sorted: [ :a :b | (start dist: a) < (start dist: b) ].
	last := intersections first rounded.
	last pointsTo: intersections last rounded do: [ :pt |
		(self rotatedForm isTransparentAt: (pt - bounds origin)) ifFalse: [ ^last ].
		last := pt.
	].
	^intersections first rounded