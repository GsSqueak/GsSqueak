testing
isValid

	^ self sessionHandle notNil
		and: [self sessionHandle isNull not]
		and: [self sessionIsRemote ~= -1]