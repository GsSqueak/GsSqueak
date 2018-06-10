testing
isModification

	^ self oldVersion notNil
		and: [self newVersion notNil]
		and: [self oldVersion ~= self newVersion]