ttf tables
processCharacterMappingTable: fontFile
	"Read the font's character to glyph index mapping table."
	| initialOffset nSubTables pID sID offset |
	initialOffset := fontFile position.
	fontFile skip: 2. "Skip table version"
	nSubTables := fontFile nextNumber: 2.
	1 to: nSubTables do:[:i|
		pID := fontFile nextNumber: 2.
		sID := fontFile nextNumber: 2.
		offset := fontFile nextNumber: 4.
		"Check if this is either a Unicode (0), Macintosh (1),
		or a Windows (3) encoded table"
		(#(0 1 3) includes: pID) ifTrue:[
			cmapType := pID.
			cmapOffset := initialOffset + offset.
			cmapType = 0 ifTrue:[^self]. "found Unicode table; use it"
		].
	].