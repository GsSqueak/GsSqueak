accessing
textColor: aColor

	textColor := aColor.
	self labels select: [:ea | ea notNil] thenDo: [:ea | ea color: textColor].