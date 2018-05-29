utility
extensionCategoryFor: category

	| tokens extensionIndex |
	category first = $* ifFalse: [^ ''].
	tokens := category findTokens: '*-' keep: '*'.
	extensionIndex := 0.
	tokens withIndexDo: [:token :index |
		token = '*'
			ifTrue: [extensionIndex := index + 1]
			ifFalse: [
				token first isUppercase ifTrue: [
					extensionIndex := index]]].

	^ (tokens allButLast: tokens size - extensionIndex)
		reduce: [:result :token |
			result last = $*
				ifTrue: [result , token]
				ifFalse: [result , '-' , token]]