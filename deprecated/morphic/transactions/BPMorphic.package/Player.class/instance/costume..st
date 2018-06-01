customevents-costume
costume: aMorph 
	"Make aMorph be the receiver's current costume"
	| _gsSqueakTemp_itsBounds |
	costume == aMorph
		ifTrue: [^ self].
	costume
		ifNotNil: [self rememberCostume: costume renderedMorph.
			_gsSqueakTemp_itsBounds := costume bounds.
			(costume ownerThatIsA: HandMorph orA: PasteUpMorph)
				replaceSubmorph: costume topRendererOrSelf
				by: aMorph.
			aMorph position: _gsSqueakTemp_itsBounds origin.
			aMorph actorState: costume actorStateOrNil.
			aMorph setNameTo: costume externalName].
	aMorph player: self.
	costume := aMorph.
	aMorph arrangeToStartStepping