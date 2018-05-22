reading
readFrom: aStreamOrFileName
	| stream name eocdPosition |
	stream := aStreamOrFileName isStream
		ifTrue: [name := aStreamOrFileName name. aStreamOrFileName]
		ifFalse: [StandardFileStream readOnlyFileNamed: (name := aStreamOrFileName)].
	stream binary.
	eocdPosition := self class findEndOfCentralDirectoryFrom: stream.
	eocdPosition <= 0 ifTrue: [self error: self class name, ' cannot find EOCD position in ', aStreamOrFileName name].
	self readEndOfCentralDirectoryFrom: stream.
	stream position: eocdPosition - centralDirectorySize.
	self readMembersFrom: stream named: name