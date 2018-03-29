simulation
ISA
	^ self class initializationOptions
		at: #ISA
		ifAbsent: [Smalltalk wordSize = 8
				ifTrue: [#X64]
				ifFalse: [#IA32]]