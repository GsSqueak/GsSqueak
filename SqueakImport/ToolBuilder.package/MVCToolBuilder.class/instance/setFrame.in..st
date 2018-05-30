private
setFrame: fractionsRectangleOrLayoutFrame in: widget
	| win |
	fractionsRectangleOrLayoutFrame ifNil: [^nil].
	win := fractionsRectangleOrLayoutFrame isRectangle
		ifTrue: [self asWindow: fractionsRectangleOrLayoutFrame]
		ifFalse: [fractionsRectangleOrLayoutFrame layout: nil in: topSize]. "assume LayoutFrame"
	widget window: win.