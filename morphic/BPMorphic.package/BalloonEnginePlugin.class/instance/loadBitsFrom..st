fills-bitmaps
loadBitsFrom: bmFill 
	"Note: Assumes that the contents of formArray has been checked
	before "
	| _gsSqueakTemp_xIndex _gsSqueakTemp_formOop _gsSqueakTemp_bitsOop _gsSqueakTemp_bitsLen |
	_gsSqueakTemp_xIndex := self objectIndexOf: bmFill.
	_gsSqueakTemp_xIndex
			> (interpreterProxy slotSizeOf: formArray)
		ifTrue: [^ nil].
	_gsSqueakTemp_formOop := interpreterProxy fetchPointer: _gsSqueakTemp_xIndex ofObject: formArray.
	_gsSqueakTemp_bitsOop := interpreterProxy fetchPointer: 0 ofObject: _gsSqueakTemp_formOop.
	_gsSqueakTemp_bitsLen := interpreterProxy slotSizeOf: _gsSqueakTemp_bitsOop.
	_gsSqueakTemp_bitsLen
			= (self bitmapSizeOf: bmFill)
		ifFalse: [^ nil].
	^ interpreterProxy firstIndexableField: _gsSqueakTemp_bitsOop