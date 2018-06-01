geometry
firstIntersectionWithLineFrom: start to: end 
	| _gsSqueakTemp_intersections _gsSqueakTemp_last |
	_gsSqueakTemp_intersections := self fullBounds extrapolatedIntersectionsWithLineFrom: start to: end.
	_gsSqueakTemp_intersections size = 1
		ifTrue: [^ _gsSqueakTemp_intersections anyOne].
	_gsSqueakTemp_intersections isEmpty
		ifTrue: [^ nil].
	_gsSqueakTemp_intersections := _gsSqueakTemp_intersections
				asSortedCollection: [:a :b | (start dist: a)
						< (start dist: b)].
	_gsSqueakTemp_last := _gsSqueakTemp_intersections first rounded.
	_gsSqueakTemp_last
		pointsTo: _gsSqueakTemp_intersections last rounded
		do: [:pt | 
			(self rotatedForm isTransparentAt: pt - bounds origin)
				ifFalse: [^ _gsSqueakTemp_last].
			_gsSqueakTemp_last := pt].
	^ _gsSqueakTemp_intersections first rounded