fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix 
	^ ({'morph'. 'morphs'. 'sp'. '*'} includes: suffix)
		ifTrue: [{SimpleServiceEntry
				provider: self
				label: 'load as morph'
				selector: #fromFileName:
				description: 'load as morph'}]
		ifFalse: [#()]