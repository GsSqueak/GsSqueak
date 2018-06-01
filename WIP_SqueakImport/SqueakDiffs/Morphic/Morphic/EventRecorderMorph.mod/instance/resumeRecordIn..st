pause/resume
resumeRecordIn: aWorld

	recHand := aWorld activeHand ifNil: [aWorld primaryHand].
	recHand newKeyboardFocus: aWorld.
	recHand addEventListener: self.

	lastEvent := nil.
	state := #record.

	voiceRecorder ifNotNil:
		[voiceRecorder clearRecordedSound.
		voiceRecorder resumeRecording.
		startSoundEvent := MorphicUnknownEvent new setType: #startSound argument: nil hand: nil stamp: Time millisecondClockValue.
		tapeStream nextPut: startSoundEvent].

	self synchronize.
