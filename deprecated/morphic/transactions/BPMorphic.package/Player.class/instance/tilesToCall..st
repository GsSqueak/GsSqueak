scripts-kernel
tilesToCall: aMethodInterface 
	"Answer a phrase for the non-typed command represented by
	aMethodInterface. "
	| _gsSqueakTemp_resultType _gsSqueakTemp_cmd _gsSqueakTemp_argType _gsSqueakTemp_argTile _gsSqueakTemp_selfTile _gsSqueakTemp_aPhrase _gsSqueakTemp_balloonTextSelector _gsSqueakTemp_aDocString _gsSqueakTemp_universal |
	self class namedTileScriptSelectors.
	_gsSqueakTemp_resultType := aMethodInterface resultType.
	_gsSqueakTemp_cmd := aMethodInterface selector.
	(_gsSqueakTemp_universal := self isUniversalTiles)
		ifTrue: [_gsSqueakTemp_aPhrase := self universalTilesForInterface: aMethodInterface]
		ifFalse: [_gsSqueakTemp_cmd numArgs = 0
				ifTrue: [_gsSqueakTemp_aPhrase := PhraseTileMorph new
								setOperator: _gsSqueakTemp_cmd
								type: _gsSqueakTemp_resultType
								rcvrType: #Player]
				ifFalse: ["only one arg supported in classic tiles, so if this is fed
					with a selector with > 1 arg, results will be very
					strange "
					_gsSqueakTemp_argType := aMethodInterface typeForArgumentNumber: 1.
					_gsSqueakTemp_aPhrase := PhraseTileMorph new
								setOperator: _gsSqueakTemp_cmd
								type: _gsSqueakTemp_resultType
								rcvrType: #Player
								argType: _gsSqueakTemp_argType.
					_gsSqueakTemp_argTile := ScriptingSystem tileForArgType: _gsSqueakTemp_argType.
					_gsSqueakTemp_argTile position: _gsSqueakTemp_aPhrase lastSubmorph position.
					_gsSqueakTemp_aPhrase lastSubmorph addMorph: _gsSqueakTemp_argTile]].
	(self slotInfo includesKey: _gsSqueakTemp_cmd)
		ifTrue: [_gsSqueakTemp_balloonTextSelector := #userSlot].
	(self belongsToUniClass
			and: [self class includesSelector: _gsSqueakTemp_cmd])
		ifTrue: [_gsSqueakTemp_aDocString := (self class userScriptForPlayer: self selector: _gsSqueakTemp_cmd) documentation.
			_gsSqueakTemp_aDocString
				ifNil: [_gsSqueakTemp_balloonTextSelector := #userScript]
				ifNotNil: [_gsSqueakTemp_aPhrase submorphs second setBalloonText: _gsSqueakTemp_aDocString]].
	(_gsSqueakTemp_universal
		ifTrue: [_gsSqueakTemp_aPhrase submorphs second]
		ifFalse: [_gsSqueakTemp_aPhrase operatorTile])
		balloonTextSelector: (_gsSqueakTemp_balloonTextSelector
				ifNil: [_gsSqueakTemp_cmd]).
	_gsSqueakTemp_universal
		ifFalse: [_gsSqueakTemp_selfTile := self tileToRefer.
			_gsSqueakTemp_selfTile position: _gsSqueakTemp_aPhrase firstSubmorph position.
			_gsSqueakTemp_aPhrase firstSubmorph addMorph: _gsSqueakTemp_selfTile.
			_gsSqueakTemp_aPhrase makeAllTilesGreen.
			_gsSqueakTemp_aPhrase justGrabbedFromViewer: false].
	^ _gsSqueakTemp_aPhrase