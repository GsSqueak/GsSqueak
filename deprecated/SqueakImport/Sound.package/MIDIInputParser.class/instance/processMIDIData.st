recording
processMIDIData
	"Process all MIDI data that has arrived since the last time this method was executed. This method should be called frequently to process, filter, and timestamp MIDI data as it arrives."

	| bytesRead |
	[(bytesRead := midiPort readInto: rawDataBuffer) > 0] whileTrue: [
		timeNow := (midiPort bufferTimeStampFrom: rawDataBuffer) - startTime.
		5 to: bytesRead do: [:i | self processByte: (rawDataBuffer at: i)]].
