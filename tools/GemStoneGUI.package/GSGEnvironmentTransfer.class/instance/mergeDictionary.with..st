diffing
mergeDictionary: dictA with: dictB

	| dict |
	dict := Dictionary new.
	dictA keysAndValuesDo: [:key :value |
		dict
			at: key
			put: (Array with: value with: nil)].
	dictB keysAndValuesDo: [:key :value |
		dict
			at: key
			ifPresent: [:array | array at: 2 put: value]
			ifAbsentPut: [Array with: nil with: value]].
	^ dict