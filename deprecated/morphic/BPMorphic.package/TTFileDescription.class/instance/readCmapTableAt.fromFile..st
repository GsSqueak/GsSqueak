glyphs
readCmapTableAt: codePoint fromFile: fontFile 
	| _gsSqueakTemp_cmapFmt _gsSqueakTemp_length _gsSqueakTemp_firstCode _gsSqueakTemp_entryCount _gsSqueakTemp_segCount _gsSqueakTemp_segIndex _gsSqueakTemp_startCode _gsSqueakTemp_idDelta _gsSqueakTemp_idRangeOffset _gsSqueakTemp_offset |
	fontFile position: cmapOffset.
	_gsSqueakTemp_cmapFmt := fontFile nextNumber: 2.
	_gsSqueakTemp_length := fontFile nextNumber: 2.
	fontFile skip: 2.
	"skip version"
	_gsSqueakTemp_cmapFmt = 0
		ifTrue: ["byte encoded table"
			codePoint > 255
				ifTrue: [^ 0].
			_gsSqueakTemp_length := _gsSqueakTemp_length - 6.
			"should be always 256"
			_gsSqueakTemp_length <= 0
				ifTrue: [^ 0].
			"but sometimes, this table is empty"
			fontFile skip: codePoint.
			"move to correct byte offset in table"
			^ fontFile next].
	_gsSqueakTemp_cmapFmt = 4
		ifTrue: ["segment mapping to deltavalues"
			codePoint > 65535
				ifTrue: [^ 0].
			_gsSqueakTemp_segCount := (fontFile nextNumber: 2)
						// 2.
			fontFile skip: 6.
			"skip searchRange, entrySelector, rangeShift"
			_gsSqueakTemp_segIndex := (0 to: _gsSqueakTemp_segCount - 1)
						detect: [:i | | endCode | (endCode := fontFile nextNumber: 2) >= codePoint].
			fontFile position: cmapOffset + 16 + (_gsSqueakTemp_segCount * 2) + (_gsSqueakTemp_segIndex * 2).
			_gsSqueakTemp_startCode := fontFile nextNumber: 2.
			_gsSqueakTemp_startCode <= codePoint
				ifFalse: [^ 0].
			"not in segment range"
			fontFile position: cmapOffset + 16 + (_gsSqueakTemp_segCount * 4) + (_gsSqueakTemp_segIndex * 2).
			_gsSqueakTemp_idDelta := fontFile nextNumber: 2.
			fontFile position: cmapOffset + 16 + (_gsSqueakTemp_segCount * 6) + (_gsSqueakTemp_segIndex * 2).
			_gsSqueakTemp_idRangeOffset := fontFile nextNumber: 2.
			_gsSqueakTemp_idRangeOffset = 0
				ifTrue: [^ _gsSqueakTemp_idDelta + codePoint bitAnd: 65535].
			_gsSqueakTemp_offset := fontFile position - 2 + _gsSqueakTemp_idRangeOffset + (codePoint - _gsSqueakTemp_startCode * 2).
			fontFile position: _gsSqueakTemp_offset.
			^ fontFile nextNumber: 2].
	_gsSqueakTemp_cmapFmt = 6
		ifTrue: ["trimmed table"
			_gsSqueakTemp_firstCode := fontFile nextNumber: 2.
			_gsSqueakTemp_entryCount := fontFile nextNumber: 2.
			(codePoint between: _gsSqueakTemp_firstCode and: _gsSqueakTemp_firstCode + _gsSqueakTemp_entryCount)
				ifFalse: [^ 0].
			fontFile skip: codePoint - _gsSqueakTemp_firstCode * 2.
			^ fontFile nextNumber: 2].
	^ 0