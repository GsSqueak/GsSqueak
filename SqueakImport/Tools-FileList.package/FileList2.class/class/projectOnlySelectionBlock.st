as yet unclassified
projectOnlySelectionBlock

	^[ :entry :myPattern |
		entry isDirectory ifTrue: [
			false
		] ifFalse: [
			#('*.pr' '*.pr.gz' '*.project') anySatisfy: [ :each | each match: entry name]
		]
	]