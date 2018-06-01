accessing
nextImage
	"Read in the next PCX image from the stream."

	| bytes form |
	self readHeader.
	bytes := self readBody.
	colorPalette := self readPalette.
	self close.
	form := ColorForm extent: width@height depth: bitsPerPixel.
	(Form new hackBits: bytes) displayOn: (Form new hackBits: form bits).
	form colors: colorPalette.
	^ form
