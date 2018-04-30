file list services
fileReaderServicesForFile: fullName suffix: suffix

	^(self  allTypicalFileExtensions 
		includes: suffix)
		ifTrue: [ self services ]
		ifFalse: [#()]
