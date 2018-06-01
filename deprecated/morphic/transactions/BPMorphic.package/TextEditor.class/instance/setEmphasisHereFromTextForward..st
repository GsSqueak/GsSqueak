typing support
setEmphasisHereFromTextForward: f 
	| _gsSqueakTemp_i _gsSqueakTemp_t _gsSqueakTemp_forward _gsSqueakTemp_delta _gsSqueakTemp_prevIsSeparator _gsSqueakTemp_nextIsSeparator |
	_gsSqueakTemp_i := self pointIndex.
	_gsSqueakTemp_t := self text.
	"Try to set emphasisHere correctly after whitespace.
	Most important after a cr, i.e. at the start of a new line"
	_gsSqueakTemp_prevIsSeparator := _gsSqueakTemp_i > 1
				and: [(_gsSqueakTemp_t at: _gsSqueakTemp_i - 1) isSeparator].
	_gsSqueakTemp_nextIsSeparator := _gsSqueakTemp_i <= _gsSqueakTemp_t size
				and: [(_gsSqueakTemp_t at: _gsSqueakTemp_i) isSeparator].
	_gsSqueakTemp_forward := _gsSqueakTemp_prevIsSeparator = _gsSqueakTemp_nextIsSeparator
				ifTrue: [f]
				ifFalse: [_gsSqueakTemp_nextIsSeparator].
	_gsSqueakTemp_delta := _gsSqueakTemp_forward
				ifTrue: [1]
				ifFalse: [0].
	emphasisHere := (_gsSqueakTemp_t
				attributesAt: (_gsSqueakTemp_i - _gsSqueakTemp_delta max: 1))
				select: [:att | att mayBeExtended]