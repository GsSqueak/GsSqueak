scrolling
hHideScrollBar

	self hIsScrollbarShowing ifFalse: [^self].
	self removeMorph: hScrollBar.
	retractableScrollBar ifFalse: [self resetExtent].

