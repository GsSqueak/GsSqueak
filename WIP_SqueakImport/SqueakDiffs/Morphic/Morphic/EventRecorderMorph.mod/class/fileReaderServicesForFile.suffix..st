fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix

	^(suffix = 'tape') | (suffix = '*') 
		ifTrue: [ self services]
		ifFalse: [#()]

