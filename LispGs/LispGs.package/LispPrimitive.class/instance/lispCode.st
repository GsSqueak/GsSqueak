as yet unclassified
lispCode
	^ (lisp
		ultimateSourceCodeAt: selector
		ifAbsent: [self error: 'missing primitive']) asString