primitives
primitivePixelValueAtX: xVal y: yVal 
	"returns the single pixel at x@y.
	It does not handle LSB bitmaps right now.
	If x or y are < 0, return 0 to indicate transparent (cf
	BitBlt>bitPeekerFromForm: usage).
	Likewise if x>width or y>depth.
	Fail if the rcvr doesn't seem to be a Form, or x|y seem wrong"
	| _gsSqueakTemp_rcvr _gsSqueakTemp_bitmap _gsSqueakTemp_depth _gsSqueakTemp_ppW _gsSqueakTemp_stride _gsSqueakTemp_bitsSize _gsSqueakTemp_word _gsSqueakTemp_mask _gsSqueakTemp_shift _gsSqueakTemp_pixel |
	_gsSqueakTemp_rcvr := self
				primitive: 'primitivePixelValueAt'
				parameters: #(#SmallInteger #SmallInteger )
				receiver: #Oop.
	"possible quick exit if x or y is -ve"
	(xVal < 0
			or: [yVal < 0])
		ifTrue: [^ interpreterProxy integerObjectOf: 0].
	"check that rcvr is plausibly a Form or subclass"
	_gsSqueakTemp_rcvr := interpreterProxy stackValue: interpreterProxy methodArgumentCount.
	((interpreterProxy isPointers: _gsSqueakTemp_rcvr)
			and: [(interpreterProxy slotSizeOf: _gsSqueakTemp_rcvr)
					>= 4])
		ifFalse: [^ interpreterProxy primitiveFail].
	"get the bits oop and width/height/depth"
	_gsSqueakTemp_bitmap := interpreterProxy fetchPointer: FormBitsIndex ofObject: _gsSqueakTemp_rcvr.
	(interpreterProxy isWordsOrBytes: _gsSqueakTemp_bitmap)
		ifFalse: [^ interpreterProxy primitiveFail].
	width := interpreterProxy fetchInteger: FormWidthIndex ofObject: _gsSqueakTemp_rcvr.
	height := interpreterProxy fetchInteger: FormHeightIndex ofObject: _gsSqueakTemp_rcvr.
	_gsSqueakTemp_depth := interpreterProxy fetchInteger: FormDepthIndex ofObject: _gsSqueakTemp_rcvr.
	"if width/height/depth are not integer, fail"
	interpreterProxy failed
		ifTrue: [^ nil].
	"possible quick exit if x or y is >= extent of form. This also catches
	cases where the width/height are < 0"
	(xVal >= width
			or: [yVal >= height])
		ifTrue: [^ interpreterProxy integerObjectOf: 0].
	"we don't handle LSB Forms yet"
	_gsSqueakTemp_depth < 0
		ifTrue: [^ interpreterProxy primitiveFail].
	"OK so now we know we have a plausible Form, the
	width/height/depth/x/y are all reasonable and it's time to plunder the
	bitmap "
	_gsSqueakTemp_ppW := 32 // _gsSqueakTemp_depth.
	"pixels in each word"
	_gsSqueakTemp_stride := width + (_gsSqueakTemp_ppW - 1) // _gsSqueakTemp_ppW.
	"how many words per row of pixels"
	_gsSqueakTemp_bitsSize := interpreterProxy byteSizeOf: _gsSqueakTemp_bitmap.
	_gsSqueakTemp_bitsSize = (_gsSqueakTemp_stride * height * 4)
		ifFalse: ["bytes per word"
			^ interpreterProxy primitiveFail].
	_gsSqueakTemp_word := interpreterProxy fetchLong32: yVal * _gsSqueakTemp_stride + (xVal // _gsSqueakTemp_ppW) ofObject: _gsSqueakTemp_bitmap.
	"load the word that contains our target"
	_gsSqueakTemp_mask := 4294967295 >> (32 - _gsSqueakTemp_depth).
	"make a mask to isolate the pixel within that word"
	_gsSqueakTemp_shift := 32 - ((xVal bitAnd: _gsSqueakTemp_ppW - 1)
					+ 1 * _gsSqueakTemp_depth).
	"this is the tricky MSB part - we mask the xVal to find how far into the
	word we need, then add 1 for the pixel we're looking for, then * depth
	to get the bit shift"
	_gsSqueakTemp_pixel := _gsSqueakTemp_word >> _gsSqueakTemp_shift bitAnd: _gsSqueakTemp_mask.
	"shift, mask and dim the lights"
	^ _gsSqueakTemp_pixel asPositiveIntegerObj"pop the incoming and push our answer"