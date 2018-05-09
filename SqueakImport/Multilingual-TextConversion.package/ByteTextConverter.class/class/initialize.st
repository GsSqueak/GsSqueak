class initialization
initialize

      self == ByteTextConverter 
		ifTrue: [self allSubclassesDo: [:c | c initialize]]
		ifFalse: [self 
					initializeDecodeTable; 
					initializeEncodeTable; 
					initializeLatin1MapAndEncodings]
