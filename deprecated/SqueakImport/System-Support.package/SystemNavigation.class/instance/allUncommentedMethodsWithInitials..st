query
allUncommentedMethodsWithInitials: targetInitials
	"Return a sorted collection with all uncommented methods whose initials (in the
	time-stamp, as logged to disk) match the given initials, in chronological order."

	^CurrentReadOnlySourceFiles cacheDuring: [
		| result |
		result := OrderedCollection new.
		self allSelectorsAndMethodsDo: [ :behavior :selector :method |
			method timeStamp ifNotEmptyDo: [ :timeStamp |
				| initials |
				initials := timeStamp substrings first.
				initials first isDigit ifFalse: [
					(initials = targetInitials and: [ 
						(behavior firstPrecodeCommentFor: selector) isNil ]) ifTrue: [
							result add: (MethodReference
								class: behavior
								selector: selector ) ] ] ] ].
		result ]