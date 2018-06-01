shapes-compressed
checkCompressedFills: indexList 
	"Check if the indexList (containing fill handles) is okay."
	| _gsSqueakTemp_fillPtr _gsSqueakTemp_length _gsSqueakTemp_fillIndex |
	"First check if the oops have the right format"
	(interpreterProxy isWords: indexList)
		ifFalse: [^ false].
	"Then check the fill entries"
	_gsSqueakTemp_length := interpreterProxy slotSizeOf: indexList.
	_gsSqueakTemp_fillPtr := interpreterProxy firstIndexableField: indexList.
	0
		to: _gsSqueakTemp_length - 1
		do: [:i | 
			_gsSqueakTemp_fillIndex := _gsSqueakTemp_fillPtr at: i.
			"Make sure the fill is okay"
			(self isFillOkay: _gsSqueakTemp_fillIndex)
				ifFalse: [^ false]].
	^ true