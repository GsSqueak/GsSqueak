private-decoding
readHeader

	| xMin xMax yMin yMax |
	self next.	"skip over manufacturer field"
	version := self next.
	encoding := self next.
	bitsPerPixel := self next.
	xMin := self nextWord.
	yMin := self nextWord.
	xMax := self nextWord.
	yMax := self nextWord.
	width := xMax - xMin + 1.
	height := yMax - yMin + 1.
	self next: 4. "skip over device resolution"
	self next: 49. "skip over EGA color palette"
	colorPlanes := self next.
	rowByteSize := self nextWord.
	isGrayScale := (self next: 2) = 2.
	self next: 58. "skip over filler"



