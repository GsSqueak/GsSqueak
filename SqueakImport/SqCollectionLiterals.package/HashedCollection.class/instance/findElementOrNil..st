*SqCollectionLiterals-*SqCollectionLiterals-compatibility
findElementOrNil: anObject
	"This method has been superseeded by #scanFor:
	It is here for compatibility with external packages only."
	^self scanFor: anObject
