resolution
unresolvedType: type

	self rules at: type ifPresent: [:rule | ^ self].
	self knownRules
		at: type
		ifPresent: [:spec | ^ self addRuleType: type withSpec: spec].
	self error: ('Could not resolve type ' , type)