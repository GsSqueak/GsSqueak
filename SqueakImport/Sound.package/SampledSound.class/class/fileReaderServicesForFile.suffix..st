file reader services
fileReaderServicesForFile: fullName suffix: suffix

	^ (suffix = 'wav')
		ifTrue: [Array with: self serviceLoadingWav]
		ifFalse: [#()]