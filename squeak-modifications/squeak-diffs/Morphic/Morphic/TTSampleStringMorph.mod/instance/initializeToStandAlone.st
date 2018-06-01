parts bin
initializeToStandAlone
	"Make me into an example"

	| dd |
	dd := TTFontDescription default.
	dd ifNil: [^ RectangleMorph initializeToStandAlone].	"not available"

	super initializeToStandAlone.
	self font: dd; color: (TranslucentColor r: 1.0 g: 0.097 b: 1.0 alpha: 0.6).
	self string: 'TrueType fonts are beautiful'.
