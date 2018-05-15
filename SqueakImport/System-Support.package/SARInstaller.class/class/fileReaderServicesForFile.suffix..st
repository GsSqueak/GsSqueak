class initialization
fileReaderServicesForFile: fullName suffix: suffix 

	^(suffix = 'sar') | (suffix = '*') 
		ifTrue: [Array with: self serviceFileInSAR]
		ifFalse: [#()]
