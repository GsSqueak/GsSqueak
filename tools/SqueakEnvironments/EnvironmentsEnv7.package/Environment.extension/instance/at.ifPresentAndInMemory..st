*EnvironmentsEnv7-emulating
at: key ifPresentAndInMemory: aBlock 
	^ declarations
		at: key
		ifPresent: [:v | v isInMemory
				ifTrue: [aBlock value: v]]
