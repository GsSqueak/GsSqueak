simulation
sizeof: objectSymbolOrClass
	"In the simulator file handles are just integer indices into openFiles and so need only be BytesPerWord big."
	^objectSymbolOrClass == #SQFile
		ifTrue: [self bytesPerWord]
		ifFalse: [super sizeof: objectSymbolOrClass]