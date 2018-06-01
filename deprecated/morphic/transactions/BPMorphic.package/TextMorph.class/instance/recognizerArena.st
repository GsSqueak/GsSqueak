containment
recognizerArena
	"Answer the rectangular area, in world coordinates, that the character
	recognizer should regard as its tablet"
	^ (self ownerThatIsA: PluggableTextMorph)
		ifNil: [self boundsInWorld]
		ifNotNil: [:_gsSqueakTemp_outer | _gsSqueakTemp_outer boundsInWorld]