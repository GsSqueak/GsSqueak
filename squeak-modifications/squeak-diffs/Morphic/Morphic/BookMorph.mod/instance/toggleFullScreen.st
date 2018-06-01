menu
toggleFullScreen
	self isInFullScreenMode
		ifTrue:	[self exitFullScreen]
		ifFalse:	[self goFullScreen]