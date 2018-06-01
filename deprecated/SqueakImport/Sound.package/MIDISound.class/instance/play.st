as yet unclassified
play
	"The base class ScorePlayer has two interfaces: a sound and a sound player. Choose the right interface depending on whether MIDI support is present."
	
	SoundService soundEnabled ifFalse: [^ self].
	
	SimpleMIDIPort useMIDIDeviceForOutput ifTrue: [
		[self openMIDIPort]
			on: Error
			do: [
				SimpleMIDIPort askForDefault.
				[self openMIDIPort]
					on: Error
					do: [
						self inform: 'Use of MIDI device is not working. Using custom synthesis.\Go to preferences to change again.' withCRs.
						SimpleMIDIPort useMIDIDeviceForOutput: false]]].

	self reset; resumePlaying.