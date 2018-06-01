fileIn/Out
writeFileNamed: fileName
	| file noVoice delta |
	file := FileStream newFileNamed: fileName.
	noVoice := true.
	tape do:[:evt | evt type = #startSound ifTrue: [noVoice := false]].
	noVoice
		ifTrue: ["Simple format (reads fast) for no voice"
				file nextPutAll:'Event Tape v1 ASCII'; cr.
				delta := tape first timeStamp.
				tape do: [:evt | file store: (evt copy setTimeStamp: evt timeStamp-delta); cr].
				file close]
		ifFalse: ["Inclusion of voice events requires general object storage"
				file nextPutAll:'Event Tape v1 BINARY'; cr.
				file fileOutClass: nil andObject: tape].
	saved := true.
	^ file name