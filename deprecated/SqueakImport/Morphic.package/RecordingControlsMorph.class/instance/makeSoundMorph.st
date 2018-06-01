button commands
makeSoundMorph

	| m |
	recorder verifyExistenceOfRecordedSound ifFalse: [^ self].

	recorder pause.
	m := SoundEventMorph new sound: recorder recordedSound.
	self world firstHand attachMorph: m.
