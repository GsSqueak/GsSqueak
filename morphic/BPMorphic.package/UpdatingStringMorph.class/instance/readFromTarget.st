target access
readFromTarget
	"Update my readout from my target"
	| _gsSqueakTemp_v _gsSqueakTemp_ret |
	(target isNil
			or: [getSelector isNil])
		ifTrue: [^ contents].
	_gsSqueakTemp_ret := self checkTarget.
	_gsSqueakTemp_ret
		ifFalse: [^ '0'].
	_gsSqueakTemp_v := target perform: getSelector.
	"scriptPerformer"
	(_gsSqueakTemp_v isKindOf: Text)
		ifTrue: [_gsSqueakTemp_v := _gsSqueakTemp_v asString].
	^ self acceptValueFromTarget: _gsSqueakTemp_v