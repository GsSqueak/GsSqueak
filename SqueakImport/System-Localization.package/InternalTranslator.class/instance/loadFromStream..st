private store-retrieve
loadFromStream: stream 
	"Load translations from an external file"
	| header isFileIn |
	header := '''Translation dictionary'''.
	isFileIn := (stream next: header size)
				= header.
	stream reset.
	isFileIn
		ifTrue: [stream fileInAnnouncing: 'Loading ' translated, stream localName]
		ifFalse: [self loadFromRefStream: stream]