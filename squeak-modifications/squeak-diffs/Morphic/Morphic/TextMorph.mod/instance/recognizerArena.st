containment
recognizerArena
	"Answer the rectangular area, in world coordinates, that the character recognizer should regard as its tablet"

	| outer |
	^ (outer := self ownerThatIsA: PluggableTextMorph)
		ifNotNil: [outer boundsInWorld]
		ifNil: [self boundsInWorld]