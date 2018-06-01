preferences
publishInSexp

	^ (Smalltalk classNamed: 'SISSDictionaryForScanning')
		ifNil: [false]
		ifNotNil: [:siss | siss publishInSexp]