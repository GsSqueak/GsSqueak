converting
flatten

	^ Generator on: [:g | 
		[self atEnd] whileFalse: [
			self next in: [:object |
				((object isCollection and: [object isString not]) or: [object isStream])
					ifFalse: [g yield: object]
					ifTrue: [object flatten do: [:each | g yield: each]]]]]