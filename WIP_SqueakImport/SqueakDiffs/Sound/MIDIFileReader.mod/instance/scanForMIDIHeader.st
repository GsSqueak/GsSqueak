private
scanForMIDIHeader
	"Scan the first part of this file in search of the MIDI header string 'MThd'. Report an error if it is not found. Otherwise, leave the input stream positioned to the first byte after this string."

	| asciiM p lastSearchPosition byte restOfHeader |
	asciiM := $M asciiValue.
	stream skip: -3.
	p := stream position.
	lastSearchPosition := p + 10000.  "search only the first 10000 bytes of the file"
	[p < lastSearchPosition and: [stream atEnd not]] whileTrue: [
		[(byte := stream next) ~= asciiM and: [byte ~~ nil]] whileTrue.  "find the next 'M' or file end"
		restOfHeader := (stream next: 3) asString.
		restOfHeader = 'Thd'
			ifTrue: [^ self]
			ifFalse: [restOfHeader size = 3 ifTrue: [stream skip: -3]].
		p := stream position].

	self error: 'MIDI header chunk not found'.
