chunk reading
readMIDIFrom: aBinaryStream
	"Read one or more MIDI tracks from the given binary stream."

	stream := aBinaryStream.
	tracks := OrderedCollection new.
	trackInfo := OrderedCollection new.
	self readHeaderChunk.
	trackCount timesRepeat: [self readTrackChunk].
	stream atEnd ifFalse: [self report: 'data beyond final track'].
	fileType = 0 ifTrue: [self splitIntoTracks].
	self guessMissingInstrumentNames.
