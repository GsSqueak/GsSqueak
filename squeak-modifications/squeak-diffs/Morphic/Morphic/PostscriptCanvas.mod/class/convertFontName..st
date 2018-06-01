font mapping
convertFontName: aName
	"Break apart aName on case boundaries, inserting hyphens as needed."
	| lastCase |
	lastCase := aName first isUppercase.
	^ String streamContents: [ :s |
		aName do: [ :c | | thisCase |
			thisCase := c isUppercase.
			(thisCase and: [ lastCase not ]) ifTrue: [ s nextPut: $- ].
			lastCase := thisCase.
			s nextPut: c ]]