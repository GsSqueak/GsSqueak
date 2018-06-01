costume
renderedCostume: aMorph remember: rememberCostume 
	"Make aMorph be the receiver's rendered costume; if flexing is
	currently in effect, make the new morph be flexed correspondingly"
	| _gsSqueakTemp_renderedMorph _gsSqueakTemp_anEventHandler _gsSqueakTemp_w _gsSqueakTemp_baseGraphic |
	_gsSqueakTemp_renderedMorph := costume renderedMorph.
	_gsSqueakTemp_renderedMorph == aMorph
		ifTrue: [^ self].
	_gsSqueakTemp_baseGraphic := costume renderedMorph valueOfProperty: #baseGraphic.
	rememberCostume
		ifTrue: [self rememberCostume: _gsSqueakTemp_renderedMorph].
	_gsSqueakTemp_renderedMorph changed.
	_gsSqueakTemp_w := _gsSqueakTemp_renderedMorph world.
	"Copy 'player state' (e.g., state which should be associated with the
	player but is stored in the morph itself these days) from the old
	rendered morph the new morph."
	aMorph rotationStyle: _gsSqueakTemp_renderedMorph rotationStyle.
	aMorph forwardDirection: _gsSqueakTemp_renderedMorph forwardDirection.
	"Note: referencePosition is *not* state but #moveTo: behavior"
	aMorph referencePosition: _gsSqueakTemp_renderedMorph referencePosition.
	_gsSqueakTemp_anEventHandler := _gsSqueakTemp_renderedMorph eventHandler.
	costume isFlexMorph
		ifTrue: [costume
				adjustAfter: [costume replaceSubmorph: _gsSqueakTemp_renderedMorph by: aMorph]]
		ifFalse: [costume owner
				ifNotNil: [costume owner replaceSubmorph: costume by: aMorph].
			aMorph player: self.
			aMorph actorState: costume actorState.
			costume knownName
				ifNotNil: [:_gsSqueakTemp_known | aMorph setNameTo: _gsSqueakTemp_known].
			costume := aMorph.
			_gsSqueakTemp_w
				ifNotNil: [_gsSqueakTemp_w stopStepping: _gsSqueakTemp_renderedMorph.
					_gsSqueakTemp_w startStepping: aMorph]].
	_gsSqueakTemp_baseGraphic
		ifNotNil: [self setBaseGraphic: _gsSqueakTemp_baseGraphic].
	aMorph eventHandler: _gsSqueakTemp_anEventHandler.
	aMorph changed