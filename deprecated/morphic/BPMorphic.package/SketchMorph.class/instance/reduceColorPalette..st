menu
reduceColorPalette: evt 
	"Let the user ask for a reduced number of colors in this sketch"
	| _gsSqueakTemp_str _gsSqueakTemp_nColors |
	_gsSqueakTemp_str := UIManager default request: 'Please enter a number greater than one.
(note: this cannot be undone, so answer zero
to abort if you need to make a backup first)' translated initialAnswer: '256'.
	_gsSqueakTemp_nColors := Integer
				readFrom: (ReadStream on: _gsSqueakTemp_str).
	(_gsSqueakTemp_nColors between: 2 and: 256)
		ifFalse: [^ self].
	originalForm := originalForm copyWithColorsReducedTo: _gsSqueakTemp_nColors.
	rotatedForm := nil.
	self changed