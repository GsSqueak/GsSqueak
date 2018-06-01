slots-user
setPrecisionFor: slotName 
	"Set the precision for the given slot name"
	| _gsSqueakTemp_aList _gsSqueakTemp_reply _gsSqueakTemp_aGetter _gsSqueakTemp_places |
	_gsSqueakTemp_aGetter := slotName asGetterSelector.
	_gsSqueakTemp_places := Utilities
				decimalPlacesForFloatPrecision: (self defaultFloatPrecisionFor: _gsSqueakTemp_aGetter).
	_gsSqueakTemp_aList := #('0' '1' '2' '3' '4' '5' '6' ).
	_gsSqueakTemp_reply := UIManager default
				chooseFrom: _gsSqueakTemp_aList
				values: (_gsSqueakTemp_aList
						collect: [:m | m asNumber])
				title: ('How many decimal places? (currently {1})' translated format: {_gsSqueakTemp_places}).
	_gsSqueakTemp_reply
		ifNotNil: [(self slotInfo includesKey: slotName)
				ifTrue: ["it's a user slot"
					(self slotInfoAt: slotName)
						floatPrecision: (Utilities floatPrecisionForDecimalPlaces: _gsSqueakTemp_reply).
					self class
						allInstancesDo: [:anInst | 
							| val |
							_gsSqueakTemp_reply = 0
								ifFalse: [(val := anInst instVarNamed: slotName asString) isInteger
										ifTrue: [anInst instVarNamed: slotName asString put: val asFloat]].
							anInst updateAllViewers]]
				ifFalse: ["it's specifying a preference for precision on a
					system-defined numeric slot"
					self noteDecimalPlaces: _gsSqueakTemp_reply forGetter: _gsSqueakTemp_aGetter.
					self updateAllViewers]]