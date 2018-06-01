testing
category: categoryName matches: prefix

	categoryName ifNil: [ ^false ].
	categoryName size < prefix size ifTrue: [ ^false ].
	(categoryName findString: prefix startingAt: 1 caseSensitive: false) = 1
		ifFalse: [ ^false ].
	^ (categoryName at: prefix size + 1 ifAbsent: [ ^true ]) = $-