halos and balloon help
boundsForBalloon
	"Some morphs have bounds that are way too big. This is a contorted
	way of making things work okay in PluggableListMorphs, whose list
	elements historically have huge widths"
	| _gsSqueakTemp_ownerOwner |
	^ ((owner notNil
				and: [(_gsSqueakTemp_ownerOwner := owner owner) notNil])
			and: [_gsSqueakTemp_ownerOwner isKindOf: PluggableListMorph])
		ifTrue: [self boundsInWorld intersect: _gsSqueakTemp_ownerOwner boundsInWorld]
		ifFalse: [super boundsForBalloon]