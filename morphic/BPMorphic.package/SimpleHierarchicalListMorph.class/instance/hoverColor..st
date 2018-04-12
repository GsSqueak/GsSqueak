accessing
hoverColor: aColor 
	self setProperty: #hoverColor toValue: aColor.
	scroller
		submorphsDo: [:ea | ea setProperty: #hoverColor toValue: aColor]