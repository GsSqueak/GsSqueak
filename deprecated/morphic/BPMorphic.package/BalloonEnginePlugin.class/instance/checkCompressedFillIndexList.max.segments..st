shapes-compressed
checkCompressedFillIndexList: fillList max: maxIndex segments: nSegs 
	"Check the fill indexes in the run-length encoded fillList"
	| _gsSqueakTemp_length _gsSqueakTemp_runLength _gsSqueakTemp_runValue _gsSqueakTemp_nFills _gsSqueakTemp_fillPtr |
	_gsSqueakTemp_length := interpreterProxy slotSizeOf: fillList.
	_gsSqueakTemp_fillPtr := interpreterProxy firstIndexableField: fillList.
	_gsSqueakTemp_nFills := 0.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | 
			_gsSqueakTemp_runLength := self shortRunLengthAt: i from: _gsSqueakTemp_fillPtr.
			_gsSqueakTemp_runValue := self shortRunValueAt: i from: _gsSqueakTemp_fillPtr.
			(_gsSqueakTemp_runValue >= 0
					and: [_gsSqueakTemp_runValue <= maxIndex])
				ifFalse: [^ false].
			_gsSqueakTemp_nFills := _gsSqueakTemp_nFills + _gsSqueakTemp_runLength].
	^ _gsSqueakTemp_nFills = nSegs