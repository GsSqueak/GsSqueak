scripts-kernel
universalTilesForInterface: aMethodInterface 
	"Return universal tiles for the given method interface. Record who self
	is. "
	| _gsSqueakTemp_ms _gsSqueakTemp_itsSelector _gsSqueakTemp_argList _gsSqueakTemp_makeSelfGlobal _gsSqueakTemp_phrase _gsSqueakTemp_aType |
	_gsSqueakTemp_itsSelector := aMethodInterface selector.
	_gsSqueakTemp_argList := OrderedCollection new.
	aMethodInterface argumentVariables
		doWithIndex: [:anArgumentVariable :anIndex | 
			| argTile |
			argTile := ScriptingSystem tileForArgType: (_gsSqueakTemp_aType := aMethodInterface typeForArgumentNumber: anIndex).
			_gsSqueakTemp_argList
				add: (_gsSqueakTemp_aType == #Player
						ifTrue: [argTile actualObject]
						ifFalse: [argTile literal])].
	_gsSqueakTemp_ms := MessageSend
				receiver: self
				selector: _gsSqueakTemp_itsSelector
				arguments: _gsSqueakTemp_argList asArray.
	"For CardPlayers, use 'self'. For others, name me, and use my global
	name. "
	_gsSqueakTemp_makeSelfGlobal := self class officialClass ~~ CardPlayer.
	_gsSqueakTemp_phrase := _gsSqueakTemp_ms asTilesIn: self class globalNames: _gsSqueakTemp_makeSelfGlobal.
	_gsSqueakTemp_makeSelfGlobal
		ifFalse: [_gsSqueakTemp_phrase setProperty: #scriptedPlayer toValue: self].
	^ _gsSqueakTemp_phrase