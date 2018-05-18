fileout
assureEmptyMethodFolder: aString

	(self fileDirectory directoryNamed: aString) entriesDo: [ :entry |
		entry extension = 'st' ifTrue: [entry delete]].
	