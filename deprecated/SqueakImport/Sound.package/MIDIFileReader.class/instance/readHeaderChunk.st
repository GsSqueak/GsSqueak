chunk reading
readHeaderChunk

	| chunkType chunkSize division |
	chunkType := self readChunkType.
	chunkType = 'RIFF' ifTrue:[chunkType := self riffSkipToMidiChunk].
	chunkType = 'MThd' ifFalse: [self scanForMIDIHeader].
	chunkSize := self readChunkSize.
	fileType := self next16BitWord.
	trackCount := self next16BitWord.
	division := self next16BitWord.
	(division anyMask: 16r8000)
		ifTrue: [self error: 'SMPTE time formats are not yet supported']
		ifFalse: [ticksPerQuarter := division].
	maxNoteTicks := 12 * 4 * ticksPerQuarter.
		"longest acceptable note; used to detect stuck notes"

	"sanity checks"
	((chunkSize < 6) or: [chunkSize > 100])
		ifTrue: [self error: 'unexpected MIDI header size ', chunkSize printString].
	(#(0 1 2) includes: fileType)
		ifFalse: [self error: 'unknown MIDI file type ', fileType printString].

	Transcript
		show: 'Reading Type ', fileType printString, ' MIDI File (';
		show: trackCount printString, ' tracks, ';
		show: ticksPerQuarter printString, ' ticks per quarter note)';
		cr.
