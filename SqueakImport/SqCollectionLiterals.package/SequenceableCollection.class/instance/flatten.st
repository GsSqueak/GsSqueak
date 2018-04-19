*SqCollectionLiterals-*SqCollectionLiterals-converting
flatten
	"Similar to #concatenation but removes all nesting except for strings.
Example: {3 .4 .{2 .4 .{'hi'} .'ho'}} flatten = {3 .4 .2 .4 .'hi' .'ho'}"

	^ Array streamContents: [:stream |
		self do: [:each |
			((each isCollection and: [each isString not]) or: [each isStream])
				ifFalse: [stream nextPut: each]
				ifTrue: [stream nextPutAll: each flatten]]]
