ttf tables
processOS2Table: fontFile 
	"
	USHORT version 0x0004
	SHORT xAvgCharWidth 
	USHORT usWeightClass 
	USHORT usWidthClass 
	USHORT fsType 
	SHORT ySubscriptXSize 
	SHORT ySubscriptYSize 
	SHORT ySubscriptXOffset 
	SHORT ySubscriptYOffset 
	SHORT ySuperscriptXSize 
	SHORT ySuperscriptYSize 
	SHORT ySuperscriptXOffset 
	SHORT ySuperscriptYOffset 
	SHORT yStrikeoutSize 
	SHORT yStrikeoutPosition 
	SHORT sFamilyClass 
	BYTE panose[10] 
	ULONG ulUnicodeRange1 Bits 0-31
	ULONG ulUnicodeRange2 Bits 32-63
	ULONG ulUnicodeRange3 Bits 64-95
	ULONG ulUnicodeRange4 Bits 96-127
	CHAR achVendID[4] 
	USHORT fsSelection 
	USHORT usFirstCharIndex 
	USHORT usLastCharIndex 
	SHORT sTypoAscender 
	SHORT sTypoDescender 
	SHORT sTypoLineGap 
	USHORT usWinAscent 
	USHORT usWinDescent 
	ULONG ulCodePageRange1 Bits 0-31
	ULONG ulCodePageRange2 Bits 32-63
	SHORT sxHeight 
	SHORT sCapHeight 
	USHORT usDefaultChar 
	USHORT usBreakChar 
	USHORT usMaxContext "
	| _gsSqueakTemp_version _gsSqueakTemp_fsSelection _gsSqueakTemp_minAscii _gsSqueakTemp_maxAscii |
	_gsSqueakTemp_version := self
				short: (fontFile nextNumber: 2).
	"table version"
	_gsSqueakTemp_version = 0
		ifTrue: [^ self].
	fontFile skip: 60.
	_gsSqueakTemp_fsSelection := fontFile nextNumber: 2.
	_gsSqueakTemp_minAscii := fontFile nextNumber: 2.
	_gsSqueakTemp_maxAscii := fontFile nextNumber: 2.
	sTypoAscender := self
				short: (fontFile nextNumber: 2).
	sTypoDescender := self
				short: (fontFile nextNumber: 2).
	sTypoLineGap := self
				short: (fontFile nextNumber: 2)