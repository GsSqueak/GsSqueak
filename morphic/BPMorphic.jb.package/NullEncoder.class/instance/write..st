writing
write: anObject 
	filterSelector
		ifNil: [filterSelector := self class filterSelector].
	anObject
		ifNotNil: [anObject perform: filterSelector with: self]