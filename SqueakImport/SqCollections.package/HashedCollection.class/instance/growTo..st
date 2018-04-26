*SqCollectionLiterals-*SqCollectionLiterals-private
growTo: anInteger
	"Grow the elements array and reinsert the old elements"
	
	| oldElements |
	oldElements := array.
	array := self class arrayType new: anInteger.
	self noCheckNoGrowFillFrom: oldElements
