shapes-compressed
checkCompressedShape: points segments: nSegments leftFills: leftFills rightFills: rightFills lineWidths: lineWidths lineFills: lineFills fillIndexList: fillIndexList 
	"Check if the given shape can be handled by the engine. 
	Since there are a number of requirements this is an extra method."
	| _gsSqueakTemp_maxFillIndex |
	(self checkCompressedPoints: points segments: nSegments)
		ifFalse: [^ false].
	(self checkCompressedFills: fillIndexList)
		ifFalse: [^ false].
	_gsSqueakTemp_maxFillIndex := interpreterProxy slotSizeOf: fillIndexList.
	(self
			checkCompressedFillIndexList: leftFills
			max: _gsSqueakTemp_maxFillIndex
			segments: nSegments)
		ifFalse: [^ false].
	(self
			checkCompressedFillIndexList: rightFills
			max: _gsSqueakTemp_maxFillIndex
			segments: nSegments)
		ifFalse: [^ false].
	(self
			checkCompressedFillIndexList: lineFills
			max: _gsSqueakTemp_maxFillIndex
			segments: nSegments)
		ifFalse: [^ false].
	(self checkCompressedLineWidths: lineWidths segments: nSegments)
		ifFalse: [^ false].
	^ true