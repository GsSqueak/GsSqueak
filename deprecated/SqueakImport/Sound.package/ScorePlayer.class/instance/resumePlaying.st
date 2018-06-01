operating
resumePlaying
	"Resume playing. Start over if done."

	done ifTrue: [self reset].
	self jumpToTick: ticksSinceStart.  "Play up to here in case we got scrolled to new position."
	score resumeFrom: self.
	midiPort
		ifNil: [super resumePlaying]  "let the sound player drive sound generation" 
		ifNotNil: [self startMIDIPlaying].  "start a process to drive MIDI output"
