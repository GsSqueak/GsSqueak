private
riffSkipToMidiChunk
	"This file is a RIFF file which may (or may not) contain a MIDI chunk. Thanks to Andreas Raab for this code."

	| dwLength fourcc |
	"Read length of all data"
	dwLength := self next32BitWord: false.
	"Get RIFF contents type "
	fourcc := self readChunkType.
	fourcc = 'RMID' ifFalse:[^fourcc]. "We can only read RMID files here"
	"Search for data"
	[[fourcc := self readChunkType.
	dwLength := self next32BitWord: false.
	fourcc = 'data'] whileFalse:[
		"Skip chunk - rounded to word boundary"
		stream skip: (dwLength + 1 bitAnd: 16rFFFFFFFE).
		stream atEnd ifTrue:[^'']].
	"Data chunk is raw - look into if it contains MIDI data and skip if not"
	fourcc := self readChunkType.
	fourcc = 'MThd'] whileFalse:[
		"Skip data (chunk - 4bytes) rounded to word boundary"
		stream skip: (dwLength - 3 bitAnd: 16rFFFFFFFE)].
	^fourcc