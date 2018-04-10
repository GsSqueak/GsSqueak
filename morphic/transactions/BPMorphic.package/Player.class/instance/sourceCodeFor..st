scripts-kernel
sourceCodeFor: sel 
	^ self class
		sourceCodeAt: sel
		ifAbsent: [Player
				sourceCodeAt: sel
				ifAbsent: ['this space for rent']]