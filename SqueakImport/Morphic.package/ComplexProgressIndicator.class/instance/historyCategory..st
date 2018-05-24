as yet unclassified
historyCategory: aKey

	History ifNil: [History := Dictionary new].
	specificHistory := History
		at: aKey
		ifAbsentPut: [Dictionary new].
	^specificHistory
