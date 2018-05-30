geometry
setScrollDeltas
	| range scrollDelta totalRange innerBounds |
	totalRange := self totalScrollRange ifNil: [^ self].
	range := self leftoverScrollRange.
	innerBounds := self innerBounds.
	scrollDelta := 10 @ 10.

	self hideOrShowScrollBar: xScrollBar
		forRange: totalRange x - (innerBounds width - yScrollBar width).
	range x <= 0
		ifTrue: [xScrollBar scrollDelta: 0.02 pageDelta: 0.2.
				xScrollBar interval: 1.0]
		ifFalse: [xScrollBar scrollDelta: (scrollDelta x / range x) asFloat
						pageDelta: (innerBounds width - scrollDelta x / range x) asFloat.
				xScrollBar interval: (innerBounds width - scrollDelta x / totalRange x) asFloat].

	self hideOrShowScrollBar: yScrollBar
		forRange: totalRange y - (innerBounds height - xScrollBar height).
	range y <= 0
		ifTrue: [yScrollBar scrollDelta: 0.02 pageDelta: 0.2.
				yScrollBar interval: 1.0]
		ifFalse: [yScrollBar scrollDelta: (scrollDelta y / range y) asFloat
						pageDelta: (innerBounds height - scrollDelta y / range y) asFloat.
				yScrollBar interval: (innerBounds height - scrollDelta y / totalRange y) asFloat]