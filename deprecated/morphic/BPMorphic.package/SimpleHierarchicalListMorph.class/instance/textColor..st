accessing
textColor: aColor 
	textColor := aColor.
	scroller
		submorphsDo: [:ea | ea color: textColor]