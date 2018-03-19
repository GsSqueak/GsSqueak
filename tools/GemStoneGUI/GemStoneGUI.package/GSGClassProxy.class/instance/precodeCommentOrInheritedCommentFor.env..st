accessing method dictionary
precodeCommentOrInheritedCommentFor: selector env: envId

	^ (self firstPrecodeCommentFor: selector env: envId) ifNil: [
		(self superclassForEnv: envId) ifNotNil: [:superclass |
			superclass precodeCommentOrInheritedCommentFor: selector env: envId]]