pause/resume
resumePlayIn: aWorld

	playHand := HandMorphForReplay new recorder: self.
	playHand position: tapeStream peek position.
	aWorld addHand: playHand.
	playHand newKeyboardFocus: aWorld.
	playHand userInitials: 'play' andPicture: nil.

	lastEvent := nil.
	lastDelta := 0@0.
	state := #play.

	self synchronize.
