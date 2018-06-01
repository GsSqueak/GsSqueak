flaps support
suppressFlapsString
	^ (self flapsSuppressed
		ifTrue: ['<no>']
		ifFalse: ['<yes>']), 'show shared tabs (F)' translated