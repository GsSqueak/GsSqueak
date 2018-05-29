ttf tables
findTable: tag in: fontFile
	"Position the fontFile at the beginning of the table with the given tag.
	Answer true if we found the table, false otherwise."
	| maxTables chksum offset length table |
	fontFile position: fileOffset.
	fontFile skip: 4. "version"
	maxTables := fontFile nextNumber: 2.
	fontFile skip: 6.
	1 to: maxTables do:[:i|
		table := (fontFile next: 4) asString.
		chksum := fontFile nextNumber: 4.
		offset := fontFile nextNumber: 4.
		length := fontFile nextNumber: 4.
		table = tag ifTrue:[
			fontFile position: offset.
			^true].
	].
	chksum. length. "fake usage"
	^false