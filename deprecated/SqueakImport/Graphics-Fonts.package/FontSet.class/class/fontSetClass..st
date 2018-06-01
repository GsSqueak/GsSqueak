private
fontSetClass: aString
	| className fontSet |
	className := (self name , (aString select: [:c | c isAlphaNumeric]) capitalized) asSymbol.
	fontSet := Smalltalk
		at: className
		ifAbsentPut: [self
			subclass: className
			instanceVariableNames: ''
			classVariableNames: ''
			poolDictionaries: ''
			category: self fontCategory].
	(fontSet inheritsFrom: self) ifFalse: [^ self error: 'The name ' , className , ' is already in use'].
	^ fontSet