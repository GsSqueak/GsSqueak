adding
ifAbsentAdd: anObject 
	"Ensure anObject is part of the receiver.  Answer whether its membership was newly acquired."
	| index |
	index := self scanFor: anObject.
	(array at: index) ifNil:
		[self
			atNewIndex: index
			put: anObject asSetElement.
		^true].
	^false