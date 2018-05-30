initialization
initializeScrollBars
	"Initialize vertical and horizontal scroll bars."

	(scrollBar := ScrollBar on: self getValue: nil setValue: #vScrollBarValue:)
			menuSelector: #vScrollBarMenuButtonPressed:;
			orientation: #vertical;
			extent: 1@1.
	(hScrollBar := ScrollBar on: self getValue: nil setValue: #hScrollBarValue:)
			menuSelector: #hScrollBarMenuButtonPressed:;
			orientation: #horizontal;
			extent: 1@1.

	""
	scroller := TransformMorph new color: Color transparent.
	scroller offset: 0 @ 0.
	self addMorph: scroller.
	""
	retractableScrollBar ifFalse: 
			[self 
				addMorph: scrollBar;
				addMorph: hScrollBar].
	self updateMinimumExtent.