processing
processOS2Table: entry
"
	USHORT  	 version   	0x0004
	SHORT 	xAvgCharWidth 	 
	USHORT 	usWeightClass 	 
	USHORT 	usWidthClass 	 
	USHORT 	fsType 	 
	SHORT 	ySubscriptXSize 	 
	SHORT 	ySubscriptYSize 	 
	SHORT 	ySubscriptXOffset 	 
	SHORT 	ySubscriptYOffset 	 
	SHORT 	ySuperscriptXSize 	 
	SHORT 	ySuperscriptYSize 	 
	SHORT 	ySuperscriptXOffset 	 
	SHORT 	ySuperscriptYOffset 	 
	SHORT 	yStrikeoutSize 	 
	SHORT 	yStrikeoutPosition 	 
	SHORT 	sFamilyClass 	 
	BYTE 	panose[10] 	 
	ULONG 	ulUnicodeRange1 	Bits 0-31
	ULONG 	ulUnicodeRange2 	Bits 32-63
	ULONG 	ulUnicodeRange3 	Bits 64-95
	ULONG 	ulUnicodeRange4 	Bits 96-127
	CHAR 	achVendID[4] 	 
	USHORT 	fsSelection 	 
	USHORT 	usFirstCharIndex 	 
	USHORT 	usLastCharIndex 	 
	SHORT 	sTypoAscender 	 
	SHORT 	sTypoDescender 	 
	SHORT 	sTypoLineGap 	 
	USHORT 	usWinAscent 	 
	USHORT 	usWinDescent 	 
	ULONG 	ulCodePageRange1 	Bits 0-31
	ULONG 	ulCodePageRange2 	Bits 32-63
	SHORT 	sxHeight 	 
	SHORT 	sCapHeight 	 
	USHORT 	usDefaultChar 	 
	USHORT 	usBreakChar 	 
	USHORT 	usMaxContext 	 "
	| version fsSelection minAscii maxAscii asc desc lGap |
	version := entry nextShort. "table version"
	version = 0 ifTrue:[^self].
	entry skip: 60.
	fsSelection := entry nextUShort.
	minAscii := entry nextUShort.
	maxAscii := entry nextUShort.
	asc := entry nextShort.
	desc := entry nextShort.
	lGap := entry nextShort.
	fontDescription setTypographicAscender: asc descender: desc lineGap: lGap.