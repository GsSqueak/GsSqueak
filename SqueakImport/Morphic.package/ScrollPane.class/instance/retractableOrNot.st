accessing retractable
retractableOrNot
	"Change scroll bar operation"

	retractableScrollBar := retractableScrollBar not.
	retractableScrollBar
		ifTrue: [
			self removeMorph: scrollBar; removeMorph: hScrollBar]
		ifFalse: [(submorphs includes: scrollBar) 
					ifFalse: 
						[self privateAddMorph: scrollBar atIndex: 1.
						self privateAddMorph: hScrollBar atIndex: 1]].
	self
		resizeScrollBars;
		resizeScroller;
		hideOrShowScrollBars;
		updateMinimumExtent.