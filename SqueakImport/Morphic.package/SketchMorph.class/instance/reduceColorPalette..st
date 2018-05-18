menu
reduceColorPalette: evt
	"Let the user ask for a reduced number of colors in this sketch"

	| str nColors |
	str := UIManager default
		request: 'Please enter a number greater than one.
(note: this cannot be undone, so answer zero
to abort if you need to make a backup first)' translated
		initialAnswer: '256'.
	nColors := Integer readFrom: (ReadStream on: str).
	(nColors between: 2 and: 256) ifFalse: [^ self].

	originalForm := originalForm copyWithColorsReducedTo: nColors.
	rotatedForm := nil.
	self changed