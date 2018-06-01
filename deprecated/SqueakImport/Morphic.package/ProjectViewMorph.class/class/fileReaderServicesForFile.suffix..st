fileIn/Out
fileReaderServicesForFile: fullName suffix: suffix

	^({ 'extseg'. 'project'. 'pr'. 'morph'. 'morphs'. 'sp'. '*' } includes: suffix)
		ifTrue: [ self services]
		ifFalse: [#()]