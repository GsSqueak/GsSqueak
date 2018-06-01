fileout
fileoutMethods: aCollection to: aFolderName

	| directory |
	directory := self fileDirectory directoryNamed: aFolderName.
	aCollection
		ifEmpty: [directory assureAbsence]
		ifNotEmpty: [
			directory assureExistence.
			directory entriesDo: [ :entry |
				entry extension = 'st' ifTrue: [entry delete]].
			aCollection do: [ :method |
				self save: aFolderName , $/ , method fileDescriptor
					contents: (method category , Character cr , method source)]]