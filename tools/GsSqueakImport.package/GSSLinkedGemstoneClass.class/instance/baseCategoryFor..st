utility
baseCategoryFor: category

	| tokens extensionIndex |
	category first = $* ifFalse: [^ category].
	tokens := category findTokens: '*-' keep: '*'.
	extensionIndex := 0.
	tokens withIndexDo: [:token :index |
		token = '*'
			ifTrue: [extensionIndex := index + 1]
			ifFalse: [
				token first isUppercase ifTrue: [
					extensionIndex := index]]].

	^ String streamContents: [:stream |
		(tokens allButFirst: extensionIndex)
			do: [:token | stream nextPutAll: token ]
			separatedBy: [ stream nextPut: $- ]]