translation
writeVMHeaderTo: aStream bytesPerWord: bytesPerWord generator: aCCodeGenerator 
	super
		writeVMHeaderTo: aStream
		bytesPerWord: bytesPerWord
		generator: aCCodeGenerator.
	SistaVM
		ifTrue: [aCCodeGenerator
				putDefineOf: #SistaVM
				as: 1
				on: aStream].
	NewspeakVM
		ifTrue: [aCCodeGenerator
				putDefineOf: #NewspeakVM
				as: 1
				on: aStream].
	MULTIPLEBYTECODESETS
		ifTrue: [aCCodeGenerator
				putDefineOf: #MULTIPLEBYTECODESETS
				as: 1
				on: aStream].
	IMMUTABILITY
		ifTrue: [aCCodeGenerator
				putConditionalDefineOf: #IMMUTABILITY
				as: 1
				comment: 'Allow this to be overridden on the compiler command line'
				on: aStream].
	SistaVM | NewspeakVM | MULTIPLEBYTECODESETS | IMMUTABILITY
		ifTrue: [aStream cr].
	aCCodeGenerator
		putDefineOf: #STACKVM
		as: 1
		on: aStream.
	(initializationOptions at: #SpurObjectMemory ifAbsent: false)
		ifTrue: [aCCodeGenerator
				putDefineOf: #SPURVM
				as: 1
				on: aStream]