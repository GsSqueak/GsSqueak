accessing
highlightTextColor: aColor 
	self setProperty: #highlightTextColor toValue: aColor.
	scroller
		submorphsDo: [:ea | ea highlightTextColor: aColor]