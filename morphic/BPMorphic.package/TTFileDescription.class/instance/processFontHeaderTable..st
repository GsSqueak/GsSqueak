ttf tables
processFontHeaderTable: fontFile 
	"Value				Data Type Description
	unitsPerEm			USHORT Granularity of the font's em square.
	xMax				USHORT Maximum X-coordinate for the entire font.
	xMin				USHORT Minimum X-coordinate for the entire font.
	yMax				USHORT Maximum Y-coordinate for the entire font.
	yMin				USHORT Minimum Y-coordinate for the entire font.
	indexToLocFormat	SHORT Used when processing the Index To Loc
	Table. "
	fontFile skip: 4.
	"Skip table version number"
	fontFile skip: 4.
	"Skip font revision number"
	fontFile skip: 4.
	"Skip check sum adjustment"
	fontFile skip: 4.
	"Skip magic number"
	fontFile skip: 2.
	"Skip flags"
	unitsPerEm := fontFile nextNumber: 2.
	fontFile skip: 8.
	"Skip creation date"
	fontFile skip: 8.
	"Skip modification date"
	"Skip min/max values of all glyphs"
	fontFile skip: 2.
	fontFile skip: 2.
	fontFile skip: 2.
	fontFile skip: 2.
	fontFile skip: 2.
	"Skip mac style"
	fontFile skip: 2.
	"Skip lowest rec PPEM"
	fontFile skip: 2.
	"Skip font direction hint"
	indexToLocFormat := fontFile nextNumber: 2