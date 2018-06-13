wrapper
executeUtf8String: sourceString session: gciSession

	^ self
		execute: sourceString
		sourceClass: self oopClassUtf8
		context: self oopIllegal
		symbolList: self oopNil
		flags: 0
		environmentId: 0
		session: gciSession