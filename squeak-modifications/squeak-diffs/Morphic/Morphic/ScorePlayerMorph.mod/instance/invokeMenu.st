menu
invokeMenu
	"Invoke a menu of additonal functions for this ScorePlayer."

	| aMenu |
	aMenu := MenuMorph new defaultTarget: self.
	aMenu add: 'open a MIDI file' translated action: #openMIDIFile.
	aMenu addList: {
		#-.
		{'save as AIFF file' translated.	#saveAsAIFF}.
		{'save as WAV file' translated.		#saveAsWAV}.
		{'save as Sun AU file' translated.	#saveAsSunAudio}.
		#-}.
	aMenu add: 'reload instruments' translated target: AbstractSound selector: #updateScorePlayers.
	aMenu addLine.
	scorePlayer midiPort
		ifNil: [
			aMenu add: 'play via MIDI' translated action: #openMIDIPort]
		ifNotNil: [
			aMenu add: 'play via built in synth' translated action: #closeMIDIPort.
			aMenu add: 'new MIDI controller' translated action: #makeMIDIController:].
	aMenu addLine.
	aMenu add: 'make a pause marker' translated action: #makeAPauseEvent:.

	aMenu popUpInWorld: self world.
