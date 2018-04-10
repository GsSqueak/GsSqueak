copying
duplicateMorphCollection: aCollection 
	"Make and return a duplicate of the receiver"
	| newCollection names |
	names := aCollection
				collect: [:ea | | newMorph | ea world
						ifNotNil: [:w | w nameForCopyIfAlreadyNamed: ea]].
	newCollection := aCollection veryDeepCopy.
	newCollection
		with: names
		do: [:newMorph :name | 
			name
				ifNotNil: [newMorph setNameTo: name].
			newMorph arrangeToStartStepping.
			newMorph privateOwner: nil.
			"no longer in world"
			newMorph isPartsDonor: false].
	^ newCollection