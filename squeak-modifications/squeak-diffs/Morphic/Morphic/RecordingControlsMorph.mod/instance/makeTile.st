button commands
makeTile
	"Make a tile representing my sound.  Get a sound-name from the user by which the sound is to be known."

	| newStyleTile sndName tile tileClass |
	tileClass := Smalltalk at: #SoundTile ifAbsent:[nil].
	recorder verifyExistenceOfRecordedSound ifFalse: [^ self].
	recorder pause.
	newStyleTile := tileClass notNil.
	newStyleTile
		ifTrue:
			[sndName := UIManager default
				request: 'Please name your new sound' translated
				initialAnswer: 'sound' translated.
			sndName isEmpty ifTrue: [^ self].

			sndName := SampledSound unusedSoundNameLike: sndName.
			SampledSound
				addLibrarySoundNamed: sndName
				samples: recorder condensedSamples
				samplingRate: recorder samplingRate.
			tile := tileClass new literal: sndName]
		ifFalse:
			[tile := InterimSoundMorph new sound: 
				(SampledSound
					samples: recorder condensedSamples
					samplingRate: recorder samplingRate)].

	tile bounds: tile fullBounds.
	tile openInHand