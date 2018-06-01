accessing
selectionColor: aColor

	self setProperty: #selectionColor toValue: aColor.
	scroller submorphsDo: [:ea | ea selectionColor: aColor].