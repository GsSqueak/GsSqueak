accessing
stylerClass
	^ super stylerClass
		ifNil: [Smalltalk classNamed: 'SHTextStylerST80']