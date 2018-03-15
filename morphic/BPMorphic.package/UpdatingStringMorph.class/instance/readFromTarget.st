target access
readFromTarget
	"Update my readout from my target"
	| _gsSqueakTemp_v _gsSqueakTemp_ret _gsSqueakTemp_places |
	(target isNil
			or: [getSelector isNil])
		ifTrue: [^ contents].
	_gsSqueakTemp_ret := self checkTarget.
	_gsSqueakTemp_ret
		ifFalse: [^ '0'].
	(target isMorph
			or: [target isPlayerLike])
		ifTrue: [_gsSqueakTemp_places := target decimalPlacesForGetter: getSelector.
			(_gsSqueakTemp_places ~= nil
					and: [_gsSqueakTemp_places
							~= (self
									valueOfProperty: #decimalPlaces
									ifAbsent: [0])])
				ifTrue: [self decimalPlaces: _gsSqueakTemp_places]].
	_gsSqueakTemp_v := target perform: getSelector.
	"scriptPerformer"
	(_gsSqueakTemp_v isKindOf: Text)
		ifTrue: [_gsSqueakTemp_v := _gsSqueakTemp_v asString].
	^ self acceptValueFromTarget: _gsSqueakTemp_v