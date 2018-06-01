ttf tables
processCharacterMappingTable: fontFile 
	"Read the font's character to glyph index mapping table."
	| _gsSqueakTemp_initialOffset _gsSqueakTemp_nSubTables _gsSqueakTemp_pID _gsSqueakTemp_sID _gsSqueakTemp_offset |
	_gsSqueakTemp_initialOffset := fontFile position.
	fontFile skip: 2.
	"Skip table version"
	_gsSqueakTemp_nSubTables := fontFile nextNumber: 2.
	1
		to: _gsSqueakTemp_nSubTables
		do: [:i | 
			_gsSqueakTemp_pID := fontFile nextNumber: 2.
			_gsSqueakTemp_sID := fontFile nextNumber: 2.
			_gsSqueakTemp_offset := fontFile nextNumber: 4.
			"Check if this is either a Unicode (0), Macintosh (1),
			or a Windows (3) encoded table"
			(#(0 1 3) includes: _gsSqueakTemp_pID)
				ifTrue: [cmapType := _gsSqueakTemp_pID.
					cmapOffset := _gsSqueakTemp_initialOffset + _gsSqueakTemp_offset.
					cmapType = 0
						ifTrue: [^ self]]]