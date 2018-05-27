*GemStoneGUI-Squeak
methodAt: aSelector ifAbsent: aBlock

	^ (self compiledMethodAt: aSelector ifAbsent: [nil])
		ifNotNil: [:method | method methodReference]