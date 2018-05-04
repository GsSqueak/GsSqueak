*EnvironmentsEnv7-binding
valueOf: aSymbol ifAbsent: aBlock 
	^ (self
		bindingOf: aSymbol
		ifAbsent: [^ aBlock value]) value
