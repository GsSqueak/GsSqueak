accessing
bareDirectory

	^ directory first == $/ 
		ifTrue: [directory copyFrom: 2 to: directory size]
		ifFalse: [directory]