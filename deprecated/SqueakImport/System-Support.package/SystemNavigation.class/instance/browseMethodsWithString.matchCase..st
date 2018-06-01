browse
browseMethodsWithString: aString matchCase: caseSensitive
	"Launch a browser on all methods that contain string literals with aString as a substring. Make the search case-sensitive or insensitive as dictated by the caseSensitive boolean parameter"

	| selector messages |
	self 
		browseAllSelect: [ :method |
			selector := messages := nil.
			method hasLiteralSuchThat: [ :literal |
				 literal isString
					 and: [ (literal includesSubstring: aString caseSensitive: caseSensitive)
					 and: [ literal isSymbol
						ifFalse: [ true ]
						ifTrue: [
							((selector ifNil: [ selector := method selector ]) == literal 
								or: [ (messages ifNil: [ messages := method messages ]) includes: literal ]) not ] ] ] ] ]
		name:  'Methods with string ', aString printString, (caseSensitive ifTrue: [' (case-sensitive)'] ifFalse: [' (case-insensitive)'])
		autoSelect: aString