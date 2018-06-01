primitives-other
primitiveCopyBuffer
	| _gsSqueakTemp_failCode _gsSqueakTemp_buf1 _gsSqueakTemp_buf2 _gsSqueakTemp_diff _gsSqueakTemp_src _gsSqueakTemp_dst |
	interpreterProxy methodArgumentCount = 2
		ifFalse: [^ interpreterProxy primitiveFailFor: PrimErrBadNumArgs].
	_gsSqueakTemp_buf2 := interpreterProxy stackValue: 0.
	_gsSqueakTemp_buf1 := interpreterProxy stackValue: 1.
	"Make sure the old buffer is properly initialized"
	(_gsSqueakTemp_failCode := self loadWorkBufferFrom: _gsSqueakTemp_buf1) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failCode].
	"Make sure the buffers are of the same type"
	(interpreterProxy fetchClassOf: _gsSqueakTemp_buf1)
			= (interpreterProxy fetchClassOf: _gsSqueakTemp_buf2)
		ifFalse: [^ interpreterProxy primitiveFailFor: GEFClassMismatch].
	"Make sure buf2 is at least of the size of buf1"
	_gsSqueakTemp_diff := (interpreterProxy slotSizeOf: _gsSqueakTemp_buf2)
				- (interpreterProxy slotSizeOf: _gsSqueakTemp_buf1).
	_gsSqueakTemp_diff < 0
		ifTrue: [^ interpreterProxy primitiveFailFor: GEFSizeMismatch].
	"Okay - ready for copying. First of all just copy the contents up to
	wbTop "
	_gsSqueakTemp_src := workBuffer.
	_gsSqueakTemp_dst := interpreterProxy firstIndexableField: _gsSqueakTemp_buf2.
	0
		to: self wbTopGet - 1
		do: [:i | _gsSqueakTemp_dst
				at: i
				put: (_gsSqueakTemp_src at: i)].
	"Adjust wbSize and wbTop in the new buffer"
	_gsSqueakTemp_dst at: GWBufferTop put: self wbTopGet + _gsSqueakTemp_diff.
	_gsSqueakTemp_dst at: GWSize put: self wbSizeGet + _gsSqueakTemp_diff.
	"Now copy the entries from wbTop to wbSize"
	_gsSqueakTemp_src := _gsSqueakTemp_src + self wbTopGet.
	_gsSqueakTemp_dst := _gsSqueakTemp_dst + self wbTopGet + _gsSqueakTemp_diff.
	0
		to: self wbSizeGet - self wbTopGet - 1
		do: [:i | _gsSqueakTemp_dst
				at: i
				put: (_gsSqueakTemp_src at: i)].
	"Okay, done. Check the new buffer by loading the state from it"
	(_gsSqueakTemp_failCode := self loadWorkBufferFrom: _gsSqueakTemp_buf2) = 0
		ifFalse: [^ interpreterProxy primitiveFailFor: _gsSqueakTemp_failCode].
	interpreterProxy pop: 2