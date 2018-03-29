loading state
loadFormsFrom: arrayOop 
	"Check all the forms from arrayOop."
	| _gsSqueakTemp_formOop _gsSqueakTemp_bmBits _gsSqueakTemp_bmBitsSize _gsSqueakTemp_bmWidth _gsSqueakTemp_bmHeight _gsSqueakTemp_bmDepth _gsSqueakTemp_ppw _gsSqueakTemp_bmRaster |
	(interpreterProxy isArray: arrayOop)
		ifFalse: [^ false].
	formArray := arrayOop.
	0
		to: (interpreterProxy slotSizeOf: formArray)
				- 1
		do: [:i | 
			_gsSqueakTemp_formOop := interpreterProxy fetchPointer: i ofObject: formArray.
			(interpreterProxy isPointers: _gsSqueakTemp_formOop)
				ifFalse: [^ false].
			(interpreterProxy slotSizeOf: _gsSqueakTemp_formOop)
					< 5
				ifTrue: [^ false].
			_gsSqueakTemp_bmBits := interpreterProxy fetchPointer: 0 ofObject: _gsSqueakTemp_formOop.
			(interpreterProxy fetchClassOf: _gsSqueakTemp_bmBits)
					= interpreterProxy classBitmap
				ifFalse: [^ false].
			_gsSqueakTemp_bmBitsSize := interpreterProxy slotSizeOf: _gsSqueakTemp_bmBits.
			_gsSqueakTemp_bmWidth := interpreterProxy fetchInteger: 1 ofObject: _gsSqueakTemp_formOop.
			_gsSqueakTemp_bmHeight := interpreterProxy fetchInteger: 2 ofObject: _gsSqueakTemp_formOop.
			_gsSqueakTemp_bmDepth := interpreterProxy fetchInteger: 3 ofObject: _gsSqueakTemp_formOop.
			interpreterProxy failed
				ifTrue: [^ false].
			(_gsSqueakTemp_bmWidth >= 0
					and: [_gsSqueakTemp_bmHeight >= 0])
				ifFalse: [^ false].
			_gsSqueakTemp_ppw := 32 // _gsSqueakTemp_bmDepth.
			_gsSqueakTemp_bmRaster := _gsSqueakTemp_bmWidth + (_gsSqueakTemp_ppw - 1) // _gsSqueakTemp_ppw.
			_gsSqueakTemp_bmBitsSize = (_gsSqueakTemp_bmRaster * _gsSqueakTemp_bmHeight)
				ifFalse: [^ false]].
	^ true