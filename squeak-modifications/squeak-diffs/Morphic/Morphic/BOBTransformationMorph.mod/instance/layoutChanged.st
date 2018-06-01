layout
layoutChanged
	"use the version from Morph"

	| myGuy |
	fullBounds := nil.
	owner ifNotNil: [owner layoutChanged].
	submorphs notEmpty 
		ifTrue: 
			[(myGuy := self firstSubmorph) isWorldMorph 
				ifFalse: 
					[worldBoundsToShow = myGuy bounds 
						ifFalse: [self changeWorldBoundsToShow: (worldBoundsToShow := myGuy bounds)]]

			"submorphs do: [:m | m ownerChanged]"	"<< I don't see any reason for this"]