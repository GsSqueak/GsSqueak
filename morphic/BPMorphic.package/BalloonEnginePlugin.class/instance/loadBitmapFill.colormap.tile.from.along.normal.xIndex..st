fills-bitmaps
loadBitmapFill: formOop colormap: cmOop tile: tileFlag from: point1 along: point2 normal: point3 xIndex: xIndex 
	"Load the bitmap fill."
	| _gsSqueakTemp_bmFill _gsSqueakTemp_cmSize _gsSqueakTemp_cmBits _gsSqueakTemp_bmBits _gsSqueakTemp_bmBitsSize _gsSqueakTemp_bmWidth _gsSqueakTemp_bmHeight _gsSqueakTemp_bmDepth _gsSqueakTemp_ppw _gsSqueakTemp_bmRaster |
	cmOop == interpreterProxy nilObject
		ifTrue: [_gsSqueakTemp_cmSize := 0.
			_gsSqueakTemp_cmBits := nil]
		ifFalse: [(interpreterProxy fetchClassOf: cmOop)
					= interpreterProxy classBitmap
				ifFalse: [^ interpreterProxy primitiveFail].
			_gsSqueakTemp_cmSize := interpreterProxy slotSizeOf: cmOop.
			_gsSqueakTemp_cmBits := interpreterProxy firstIndexableField: cmOop].
	(interpreterProxy isPointers: formOop)
		ifFalse: [^ interpreterProxy primitiveFail].
	(interpreterProxy slotSizeOf: formOop)
			< 5
		ifTrue: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_bmBits := interpreterProxy fetchPointer: 0 ofObject: formOop.
	(interpreterProxy fetchClassOf: _gsSqueakTemp_bmBits)
			= interpreterProxy classBitmap
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_bmBitsSize := interpreterProxy slotSizeOf: _gsSqueakTemp_bmBits.
	_gsSqueakTemp_bmWidth := interpreterProxy fetchInteger: 1 ofObject: formOop.
	_gsSqueakTemp_bmHeight := interpreterProxy fetchInteger: 2 ofObject: formOop.
	_gsSqueakTemp_bmDepth := interpreterProxy fetchInteger: 3 ofObject: formOop.
	interpreterProxy failed
		ifTrue: [^ nil].
	(_gsSqueakTemp_bmWidth >= 0
			and: [_gsSqueakTemp_bmHeight >= 0])
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_bmDepth = 32 | (_gsSqueakTemp_bmDepth = 8) | (_gsSqueakTemp_bmDepth = 16) | (_gsSqueakTemp_bmDepth = 1) | (_gsSqueakTemp_bmDepth = 2) | (_gsSqueakTemp_bmDepth = 4)
		ifFalse: [^ interpreterProxy primitiveFail].
	(_gsSqueakTemp_cmSize = 0
			or: [_gsSqueakTemp_cmSize = (1 << _gsSqueakTemp_bmDepth)])
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_ppw := 32 // _gsSqueakTemp_bmDepth.
	_gsSqueakTemp_bmRaster := _gsSqueakTemp_bmWidth + (_gsSqueakTemp_ppw - 1) // _gsSqueakTemp_ppw.
	_gsSqueakTemp_bmBitsSize = (_gsSqueakTemp_bmRaster * _gsSqueakTemp_bmHeight)
		ifFalse: [^ interpreterProxy primitiveFail].
	_gsSqueakTemp_bmFill := self allocateBitmapFill: _gsSqueakTemp_cmSize colormap: _gsSqueakTemp_cmBits.
	engineStopped
		ifTrue: [^ nil].
	self bitmapWidthOf: _gsSqueakTemp_bmFill put: _gsSqueakTemp_bmWidth.
	self bitmapHeightOf: _gsSqueakTemp_bmFill put: _gsSqueakTemp_bmHeight.
	self bitmapDepthOf: _gsSqueakTemp_bmFill put: _gsSqueakTemp_bmDepth.
	self bitmapRasterOf: _gsSqueakTemp_bmFill put: _gsSqueakTemp_bmRaster.
	self bitmapSizeOf: _gsSqueakTemp_bmFill put: _gsSqueakTemp_bmBitsSize.
	self bitmapTileFlagOf: _gsSqueakTemp_bmFill put: tileFlag.
	self objectIndexOf: _gsSqueakTemp_bmFill put: xIndex.
	self
		loadFillOrientation: _gsSqueakTemp_bmFill
		from: point1
		along: point2
		normal: point3
		width: _gsSqueakTemp_bmWidth
		height: _gsSqueakTemp_bmHeight.
	^ _gsSqueakTemp_bmFill