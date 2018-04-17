adding
addAll: aCollection
	"Include all the associations of aCollection as the receiver's elements. Answer 
	aCollection. Any collection containing associations can be used as argument."

	aCollection == self ifFalse: [
		aCollection associationsDo: [:assoc| self add: assoc].
	].
	^aCollection