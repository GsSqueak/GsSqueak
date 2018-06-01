*SqCollectionLiterals-*SqCollectionLiterals-testing
includesKey: key 
	"Answer whether the receiver has a key equal to the argument, key."
	
	(array at: (self scanFor: key)) ifNil: [ ^false ] ifNotNil: [ ^true ]
