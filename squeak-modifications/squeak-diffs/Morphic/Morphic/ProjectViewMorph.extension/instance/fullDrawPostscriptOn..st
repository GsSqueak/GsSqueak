*Morphic-MorphicExtras-*morphic-Postscript Canvases
fullDrawPostscriptOn: aCanvas

	| f |
	"handle the fact that we have the squished text within"

	f := self imageForm.
	f offset: 0@0.
	aCanvas paintImage: f at: bounds origin.
