accessing
filterColor: aColor

	self setProperty: #filterColor toValue: aColor.
	scroller submorphsDo: [:ea | ea filterColor: aColor].