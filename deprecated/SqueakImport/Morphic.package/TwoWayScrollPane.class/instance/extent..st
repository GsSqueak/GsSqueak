geometry
extent: newExtent
	bounds extent = newExtent ifTrue: [^ self].
	super extent: (newExtent max: 36@32).
	self resizeScrollBar; resizeScroller; setScrollDeltas.
