Mac reader
readMacFontHex: fileName
	"Read the hex version of a Mac FONT type resource.  See the method aComment for how to prepare the input file. 4/26/96 tk"
	| file hh fRectWidth |
	name := fileName.	"Palatino 12"
	file := FileStream readOnlyFileNamed: fileName, ' hex'.

	"See Inside Macintosh page IV-42 for this record"
	"FontType := " Number readFrom: (file next: 4) base: 16.
	emphasis		:=		0.
	minAscii := Number readFrom: (file next: 4) base: 16.
	maxAscii := Number readFrom: (file next: 4) base: 16.
	maxWidth		:= Number readFrom: (file next: 4) base: 16.
	"kernMax := " Number readFrom: (file next: 4) base: 16.
	"NDescent := " Number readFrom: (file next: 4) base: 16.
	fRectWidth :=  Number readFrom: (file next: 4) base: 16.
	hh :=  Number readFrom: (file next: 4) base: 16.
	"OWTLoc := " Number readFrom: (file next: 4) base: 16.
	ascent			:= Number readFrom: (file next: 4) base: 16.
	descent			:= Number readFrom: (file next: 4) base: 16.
	"leading := " Number readFrom: (file next: 4) base: 16.
	xOffset			:=		0. 	
	raster			:= Number readFrom: (file next: 4) base: 16.

	strikeLength	:=		raster*16.
	superscript		:=		ascent - descent // 3.	
	subscript		:=		descent - ascent // 3.	
	self strikeFromHex: file width: raster height: hh.
	self xTableFromHex: file.
	file close.

	"Insert one pixel between each character.  And add space character."
	self fixKerning: (fRectWidth - maxWidth).	

	"Recompute character to glyph mapping"
	characterToGlyphMap := nil.