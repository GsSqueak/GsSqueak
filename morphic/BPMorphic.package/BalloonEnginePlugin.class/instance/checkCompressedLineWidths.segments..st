shapes-compressed
checkCompressedLineWidths: lineWidthList segments: nSegments 
	"Check the run-length encoded lineWidthList matches nSegments"
	| _gsSqueakTemp_length _gsSqueakTemp_runLength _gsSqueakTemp_nItems _gsSqueakTemp_ptr |
	_gsSqueakTemp_length := interpreterProxy slotSizeOf: lineWidthList.
	_gsSqueakTemp_ptr := interpreterProxy firstIndexableField: lineWidthList.
	_gsSqueakTemp_nItems := 0.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | 
			_gsSqueakTemp_runLength := self shortRunLengthAt: i from: _gsSqueakTemp_ptr.
			_gsSqueakTemp_nItems := _gsSqueakTemp_nItems + _gsSqueakTemp_runLength].
	^ _gsSqueakTemp_nItems = nSegments