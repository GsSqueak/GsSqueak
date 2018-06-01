glyphs
readCmapTableAt: codePoint fromFile: fontFile
	| cmapFmt length firstCode entryCount segCount segIndex startCode idDelta idRangeOffset offset |
	fontFile position: cmapOffset.
	cmapFmt := fontFile nextNumber: 2.
	length := fontFile nextNumber: 2.
	fontFile skip: 2. "skip version"

	cmapFmt = 0 ifTrue:["byte encoded table"
		codePoint > 255 ifTrue:[^0].
		length := length - 6. 		"should be always 256"
		length <= 0 ifTrue: [^0].	"but sometimes, this table is empty"
		fontFile skip: codePoint.		"move to correct byte offset in table"
		^fontFile next].

	cmapFmt = 4 ifTrue:[ "segment mapping to deltavalues"
		codePoint > 16rFFFF ifTrue:[^0].
		segCount := (fontFile nextNumber: 2) // 2.
		fontFile skip: 6. "skip searchRange, entrySelector, rangeShift"
		segIndex := (0 to: segCount-1) 
			detect:[:i| | endCode | (endCode := (fontFile nextNumber: 2)) >= codePoint].
		fontFile position: cmapOffset + 16 + (segCount*2) + (segIndex*2).
		startCode := fontFile nextNumber: 2.
		startCode <= codePoint ifFalse:[^0]. "not in segment range"
		fontFile position: cmapOffset + 16 + (segCount*4) + (segIndex*2).
		idDelta := fontFile nextNumber: 2.
		fontFile position: cmapOffset + 16 + (segCount*6) + (segIndex*2).
		idRangeOffset := fontFile nextNumber: 2.
		idRangeOffset = 0 ifTrue:[^(idDelta + codePoint) bitAnd: 16rFFFF].
		offset := (fontFile position - 2) + idRangeOffset + ((codePoint - startCode) * 2).
		fontFile position: offset.
		^fontFile nextNumber: 2.
	].

	cmapFmt = 6 ifTrue:[ "trimmed table"
		firstCode := fontFile nextNumber: 2.
		entryCount := fontFile nextNumber: 2.
		(codePoint between: firstCode and: firstCode+entryCount) ifFalse:[^0].
		fontFile skip: (codePoint-firstCode) * 2.
		^fontFile nextNumber: 2].

	^0