as yet unclassified
loadingHistoryDataForKey: anObject

	| answer |
	answer := specificHistory 
		at: anObject
		ifAbsentPut: [OrderedCollection new].
	answer size > 50 ifTrue: [
		answer := answer copyFrom: 25 to: answer size.
		specificHistory at: anObject put: answer.
	].
	^answer

