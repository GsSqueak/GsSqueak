fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix

	^(suffix = 'bo') | (suffix = '*') 
		ifTrue: [ Array with: self serviceLoadAsBook]
		ifFalse: [#()]
