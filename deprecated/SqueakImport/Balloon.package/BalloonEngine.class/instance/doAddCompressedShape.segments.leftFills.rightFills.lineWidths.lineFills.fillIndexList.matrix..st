profiling
doAddCompressedShape: points segments: nSegments leftFills: leftFills rightFills: rightFills lineWidths: lineWidths lineFills: lineFills fillIndexList: fillIndexList matrix: aMatrix
	"Note: This method is for profiling the overhead of loading a compressed shape into the engine."
	^self primAddCompressedShape: points segments: nSegments leftFills: leftFills rightFills: rightFills lineWidths: lineWidths lineFills: lineFills fillIndexList: fillIndexList matrix: aMatrix