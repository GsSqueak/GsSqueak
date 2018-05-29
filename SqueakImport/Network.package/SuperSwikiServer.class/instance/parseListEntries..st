private
parseListEntries: listResult

	| c first |
	c := self fastParseEntriesFrom: listResult.
	c ifNotNil: [^c].
	c := OrderedCollection new.
	first := true.
	listResult linesDo: [ :x |
		first ifFalse: [c add: (Compiler evaluate: x)].
		first := false.
	].
	^c
