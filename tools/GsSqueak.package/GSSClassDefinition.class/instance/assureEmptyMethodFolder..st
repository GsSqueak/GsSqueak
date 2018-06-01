fileout
assureEmptyMethodFolder: aString

	| directory |
	directory := self fileDirectory directoryNamed: aString.
	directory assureExistence.
	directory entriesDo: [ :entry |
		entry extension = 'st' ifTrue: [entry delete]].
	