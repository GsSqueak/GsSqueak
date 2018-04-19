*SqCollectionLiterals-*SqCollectionLiterals-accessing
values
	"Answer a Collection containing the receiver's values."

	^Array new: self size streamContents: [ :stream |
		self valuesDo: [ :value | stream nextPut: value] ]
