as yet unclassified
selectionBlockForSuffixes: anArray

	^[ :entry :myPattern |
		entry isDirectory ifTrue: [
			false
		] ifFalse: [
			anArray anySatisfy: [ :each | each match: entry name]
		]
	]