accessing
filterTextColor: aColor 
	self setProperty: #filterTextColor toValue: aColor.
	scroller
		submorphsDo: [:ea | ea filterTextColor: aColor]