testing
exists
	^ (self containingDirectory
		entryAt: self name
		ifAbsent: [ nil ]) notNil