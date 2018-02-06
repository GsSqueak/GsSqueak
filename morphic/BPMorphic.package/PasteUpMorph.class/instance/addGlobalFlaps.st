flaps
addGlobalFlaps
	"Must make global flaps adapt to world. Do this even if not shown, so
	the old world will not be pointed at by the flaps."
	| use thisWorld |
	use := Flaps sharedFlapsAllowed.
	Project current flapsSuppressed
		ifTrue: [use := false].
	"Smalltalk isMorphic ifFalse: [use := false]."
	thisWorld := use
				ifTrue: [self]
				ifFalse: [PasteUpMorph new initForProject: WorldState new;
						
						bounds: (0 @ 0 extent: 4000 @ 4000);
						
						viewBox: (0 @ 0 extent: 4000 @ 4000)
					"fake to be flap owner"].
	Flaps globalFlapTabsIfAny
		do: [:aFlapTab | (Project current isFlapEnabled: aFlapTab)
				ifTrue: [aFlapTab world == thisWorld
						ifFalse: [thisWorld addMorphFront: aFlapTab.
							aFlapTab adaptToWorld: thisWorld].
					"always do"
					use
						ifTrue: [aFlapTab spanWorld.
							aFlapTab adjustPositionAfterHidingFlap.
							aFlapTab flapShowing
								ifTrue: [aFlapTab showFlap]]]]