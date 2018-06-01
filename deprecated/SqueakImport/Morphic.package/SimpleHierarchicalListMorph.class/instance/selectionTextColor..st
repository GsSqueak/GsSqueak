accessing
selectionTextColor: aColor

	self setProperty: #selectionTextColor toValue: aColor.
	scroller submorphsDo: [:ea | ea selectionTextColor: aColor].