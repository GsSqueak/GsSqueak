file reader services
fileReaderServicesForFile: fullName suffix: suffix

	^ (self on: fullName) exists
		ifTrue: [self services]
		ifFalse: [#()].