interpreter interface
loadColorMap
	"ColorMap, if not nil, must be longWords, and 
	2^N long, where N = sourceDepth for 1, 2, 4, 8 bits, 
	or N = 9, 12, or 15 (3, 4, 5 bits per color) for 16 or 32 bits."
	| _gsSqueakTemp_cmSize _gsSqueakTemp_oldStyle _gsSqueakTemp_oop _gsSqueakTemp_cmOop |
	<inline: true>
	cmFlags := cmMask := cmBitsPerColor := 0.
	cmShiftTable := nil.
	cmMaskTable := nil.
	cmLookupTable := nil.
	_gsSqueakTemp_cmOop := interpreterProxy fetchPointer: BBColorMapIndex ofObject: bitBltOop.
	_gsSqueakTemp_cmOop = interpreterProxy nilObject
		ifTrue: [^ true].
	cmFlags := ColorMapPresent.
	"even if identity or somesuch - may be cleared later"
	_gsSqueakTemp_oldStyle := false.
	(interpreterProxy isWords: _gsSqueakTemp_cmOop)
		ifTrue: ["This is an old-style color map (indexed only, with implicit
			RGBA conversion)"
			_gsSqueakTemp_cmSize := interpreterProxy slotSizeOf: _gsSqueakTemp_cmOop.
			cmLookupTable := interpreterProxy firstIndexableField: _gsSqueakTemp_cmOop.
			_gsSqueakTemp_oldStyle := true]
		ifFalse: ["A new-style color map (fully qualified)"
			((interpreterProxy isPointers: _gsSqueakTemp_cmOop)
					and: [(interpreterProxy slotSizeOf: _gsSqueakTemp_cmOop)
							>= 3])
				ifFalse: [^ false].
			cmShiftTable := self
						loadColorMapShiftOrMaskFrom: (interpreterProxy fetchPointer: 0 ofObject: _gsSqueakTemp_cmOop).
			cmMaskTable := self
						loadColorMapShiftOrMaskFrom: (interpreterProxy fetchPointer: 1 ofObject: _gsSqueakTemp_cmOop).
			_gsSqueakTemp_oop := interpreterProxy fetchPointer: 2 ofObject: _gsSqueakTemp_cmOop.
			_gsSqueakTemp_oop = interpreterProxy nilObject
				ifTrue: [_gsSqueakTemp_cmSize := 0]
				ifFalse: [(interpreterProxy isWords: _gsSqueakTemp_oop)
						ifFalse: [^ false].
					_gsSqueakTemp_cmSize := interpreterProxy slotSizeOf: _gsSqueakTemp_oop.
					cmLookupTable := interpreterProxy firstIndexableField: _gsSqueakTemp_oop].
			cmFlags := cmFlags bitOr: ColorMapNewStyle.
			self
				cCode: ''
				inSmalltalk: []].
	(_gsSqueakTemp_cmSize bitAnd: _gsSqueakTemp_cmSize - 1)
			= 0
		ifFalse: [^ false].
	cmMask := _gsSqueakTemp_cmSize - 1.
	cmBitsPerColor := 0.
	_gsSqueakTemp_cmSize = 512
		ifTrue: [cmBitsPerColor := 3].
	_gsSqueakTemp_cmSize = 4096
		ifTrue: [cmBitsPerColor := 4].
	_gsSqueakTemp_cmSize = 32768
		ifTrue: [cmBitsPerColor := 5].
	_gsSqueakTemp_cmSize = 0
		ifTrue: [cmLookupTable := nil.
			cmMask := 0]
		ifFalse: [cmFlags := cmFlags bitOr: ColorMapIndexedPart].
	_gsSqueakTemp_oldStyle
		ifTrue: ["needs implicit conversion"
			self setupColorMasks].
	"Check if colorMap is just identity mapping for RGBA parts"
	(self isIdentityMap: cmShiftTable with: cmMaskTable)
		ifTrue: [cmMaskTable := nil.
			cmShiftTable := nil]
		ifFalse: [cmFlags := cmFlags bitOr: ColorMapFixedPart].
	^ true