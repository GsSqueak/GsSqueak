applying
applyTo: aClass

	^ aClass
		compileMethod: self newVersion sourceString
		category: self newVersion category