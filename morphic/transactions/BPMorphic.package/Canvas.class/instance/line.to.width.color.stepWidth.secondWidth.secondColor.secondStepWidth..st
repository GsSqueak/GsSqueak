drawing
line: pt1 to: pt2 width: w1 color: c1 stepWidth: s1 secondWidth: w2 secondColor: c2 secondStepWidth: s2 
	"Draw a line using the given width, colors and steps; both steps can 
	have different stepWidths (firstStep, secondStep), draw widths and 
	colors."
	| _gsSqueakTemp_bigSteps _gsSqueakTemp_offsetPoint _gsSqueakTemp_dist _gsSqueakTemp_p1p2Vec _gsSqueakTemp_deltaBig _gsSqueakTemp_delta1 _gsSqueakTemp_delta2 _gsSqueakTemp_lastPoint _gsSqueakTemp_bigStep |
	s1 = 0 & (s2 = 0)
		ifTrue: [^ self].
	_gsSqueakTemp_dist := pt1 dist: pt2.
	_gsSqueakTemp_dist = 0
		ifTrue: [^ self].
	_gsSqueakTemp_bigStep := s1 + s2.
	_gsSqueakTemp_bigSteps := _gsSqueakTemp_dist / _gsSqueakTemp_bigStep.
	_gsSqueakTemp_p1p2Vec := pt2 - pt1.
	_gsSqueakTemp_deltaBig := _gsSqueakTemp_p1p2Vec / _gsSqueakTemp_bigSteps.
	_gsSqueakTemp_delta1 := _gsSqueakTemp_deltaBig * (s1 / _gsSqueakTemp_bigStep).
	_gsSqueakTemp_delta2 := _gsSqueakTemp_deltaBig * (s2 / _gsSqueakTemp_bigStep).
	_gsSqueakTemp_dist <= s1
		ifTrue: [self
				line: pt1 rounded
				to: pt2 rounded
				width: w1
				color: c1.
			^ self].
	0
		to: _gsSqueakTemp_bigSteps truncated - 1
		do: [:bigStepIx | 
			self
				line: (pt1 + (_gsSqueakTemp_offsetPoint := _gsSqueakTemp_deltaBig * bigStepIx)) rounded
				to: (pt1 + (_gsSqueakTemp_offsetPoint := _gsSqueakTemp_offsetPoint + _gsSqueakTemp_delta1)) rounded
				width: w1
				color: c1.
			self
				line: (pt1 + _gsSqueakTemp_offsetPoint) rounded
				to: (pt1 + (_gsSqueakTemp_offsetPoint + _gsSqueakTemp_delta2)) rounded
				width: w2
				color: c2].
	"if there was no loop, offsetPoint is nil"
	_gsSqueakTemp_lastPoint := pt1 + ((_gsSqueakTemp_offsetPoint
					ifNil: [0 @ 0])
					+ _gsSqueakTemp_delta2).
	(_gsSqueakTemp_lastPoint dist: pt2)
			<= s1
		ifTrue: [self
				line: _gsSqueakTemp_lastPoint rounded
				to: pt2 rounded
				width: w1
				color: c1]
		ifFalse: [self
				line: _gsSqueakTemp_lastPoint rounded
				to: (_gsSqueakTemp_lastPoint + _gsSqueakTemp_delta1) rounded
				width: w1
				color: c1.
			self
				line: (_gsSqueakTemp_lastPoint + _gsSqueakTemp_delta1) rounded
				to: pt2
				width: w1
				color: c2]