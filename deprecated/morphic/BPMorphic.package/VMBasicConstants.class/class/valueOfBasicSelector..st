C translation
valueOfBasicSelector: selector 
	"Answer the numberic value of a basic constant accessed via the
	selector. Answer nil if selector is not a basic constant accessor."
	"self mostBasicConstantSelectors collect: [:s| {s. self
	valueOfBasicSelector: s}]"
	| _gsSqueakTemp_index _gsSqueakTemp_key |
	^ ((_gsSqueakTemp_index := self mostBasicConstantSelectors indexOf: selector) > 0
			and: [(_gsSqueakTemp_key := self mostBasicConstantNames
								at: _gsSqueakTemp_index
								ifAbsent: []) notNil
					and: [self includesKey: _gsSqueakTemp_key]])
		ifTrue: [classPool at: _gsSqueakTemp_key]