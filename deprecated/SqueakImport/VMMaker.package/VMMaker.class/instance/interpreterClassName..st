generate sources
interpreterClassName: aString

	| tmp |
	interpreterClassName := aString.
	tmp := Smalltalk at: aString asSymbol ifAbsent: [nil].
	(tmp isNil or: [tmp isBehavior not]) ifTrue:
		[self invalidInterpreterClassName].