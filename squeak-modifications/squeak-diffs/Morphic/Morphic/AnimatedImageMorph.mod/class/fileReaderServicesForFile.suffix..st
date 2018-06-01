fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix

	^((AnimatedGIFReadWriter typicalFileExtensions asSet
		add: '*'; add: 'form'; yourself)
		includes: suffix)
		ifTrue: [ self services ]
		ifFalse: [#()]
