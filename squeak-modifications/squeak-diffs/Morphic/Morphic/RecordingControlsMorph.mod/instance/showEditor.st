button commands
showEditor
	"Show my samples in a WaveEditor."

	| ed w |
	recorder verifyExistenceOfRecordedSound ifFalse: [^ self].
	recorder pause.
	ed := WaveEditor new.
	ed data: recorder condensedSamples.
	ed samplingRate: recorder samplingRate.
	w := self world.
	w activeHand
		ifNil: [w addMorph: ed]
		ifNotNil: [w activeHand attachMorph: ed].

