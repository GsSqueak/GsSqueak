real-time processing
midiDo: aBlock
	"Poll the incoming MIDI stream in real time and call the given block for each complete command that has been received. The block takes one argument, which is an array of the form (<time><cmd byte>[<arg1>[<arg2>]]). The number of arguments depends on the command byte. For system exclusive commands, the argument is a ByteArray containing the system exclusive message."

	self processMIDIData.
	[received isEmpty] whileFalse:
		[aBlock value: received removeFirst].
