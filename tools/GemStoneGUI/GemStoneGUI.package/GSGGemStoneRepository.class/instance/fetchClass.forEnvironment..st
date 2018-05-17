querying
fetchClass: queryCode forEnvironment: anEnvironment

	^ self
		fetch: queryCode
		serialization: [:code | self serializeClass: code]
		deserialization: [:output |
			output = 'nil'
				ifTrue: [nil]
				ifFalse: [self deserializeClass: output forEnvironment: anEnvironment]]