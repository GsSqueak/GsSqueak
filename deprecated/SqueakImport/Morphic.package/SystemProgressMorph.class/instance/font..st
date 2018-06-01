accessing
font: anObject

	font := anObject.
	self labels select: [:ea | ea notNil] thenDo: [:ea | ea font: font].