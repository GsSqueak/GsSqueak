converting
convertToWithConverter: converter 

	^(converter ifNil: [ ^self]) encodeString: self
