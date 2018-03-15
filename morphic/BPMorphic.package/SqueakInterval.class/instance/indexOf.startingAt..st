accessing
indexOf: anElement startingAt: startIndex 
	"startIndex is an positive integer, the collection index where the search
	is started."
	"during the computation of val , floats are only used when the
	receiver	contains floats"
	| _gsSqueakTemp_index _gsSqueakTemp_val |
	(self rangeIncludes: anElement)
		ifFalse: [^ 0].
	_gsSqueakTemp_val := anElement - self first / self increment.
	_gsSqueakTemp_val isFloat
		ifTrue: [(_gsSqueakTemp_val - _gsSqueakTemp_val rounded) abs * 100000000 < 1
				ifFalse: [^ 0].
			_gsSqueakTemp_index := _gsSqueakTemp_val rounded + 1]
		ifFalse: [_gsSqueakTemp_val isInteger
				ifFalse: [^ 0].
			_gsSqueakTemp_index := _gsSqueakTemp_val + 1].
	"finally, the value of startIndex comes into play:"
	(_gsSqueakTemp_index between: startIndex and: self size)
		ifFalse: [^ 0].
	^ _gsSqueakTemp_index