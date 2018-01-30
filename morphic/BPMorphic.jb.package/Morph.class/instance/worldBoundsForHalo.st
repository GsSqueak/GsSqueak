geometry
worldBoundsForHalo
	"Answer the rectangle to be used as the inner dimension of my halos.
	Allow for showing either bounds or fullBounds, and compensate for
	the optional bounds rectangle."
	| r |
	r := Preferences haloEnclosesFullBounds
				ifTrue: [self fullBoundsInWorld]
				ifFalse: [self boundsIn: nil].
	Preferences showBoundsInHalo
		ifTrue: [^ r outsetBy: 2].
	^ r