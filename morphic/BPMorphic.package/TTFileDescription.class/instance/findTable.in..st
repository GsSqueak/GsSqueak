ttf tables
findTable: tag in: fontFile 
	"Position the fontFile at the beginning of the table with the given tag.
	Answer true if we found the table, false otherwise."
	| _gsSqueakTemp_maxTables _gsSqueakTemp_chksum _gsSqueakTemp_offset _gsSqueakTemp_length _gsSqueakTemp_table |
	fontFile position: fileOffset.
	fontFile skip: 4.
	"version"
	_gsSqueakTemp_maxTables := fontFile nextNumber: 2.
	fontFile skip: 6.
	1
		to: _gsSqueakTemp_maxTables
		do: [:i | 
			_gsSqueakTemp_table := (fontFile next: 4) asString.
			_gsSqueakTemp_chksum := fontFile nextNumber: 4.
			_gsSqueakTemp_offset := fontFile nextNumber: 4.
			_gsSqueakTemp_length := fontFile nextNumber: 4.
			_gsSqueakTemp_table = tag
				ifTrue: [fontFile position: _gsSqueakTemp_offset.
					^ true]].
	_gsSqueakTemp_chksum.
	_gsSqueakTemp_length.
	"fake usage"
	^ false