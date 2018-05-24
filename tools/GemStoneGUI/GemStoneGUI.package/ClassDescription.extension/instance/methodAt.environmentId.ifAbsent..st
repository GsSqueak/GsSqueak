*GemStoneGUI-Squeak
methodAt: aSelector environmentId: envId ifAbsent: aBlock

	^ (self compiledMethodAt: aSelector ifAbsent: [nil])
		ifNotNil: [:method | method methodReference]