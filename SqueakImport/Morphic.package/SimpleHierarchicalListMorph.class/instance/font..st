accessing
font: aFont
	font := aFont.
	scroller submorphsDo: [:ea | ea font: font].