queries
fetchArrayOfSymbols: queryCode

	^ self
		fetch: queryCode
		serialization: [:code |
			self serializeCollection: code elementTransformation: '']
		deserialization: [:output |
			self deserializeCollection: output eachElementDo: [:element | element asString]]
		errorHandling: nil