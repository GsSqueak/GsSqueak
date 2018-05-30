layout
canEncroachWhiteSpaceOf: morphs 
	^ morphs allSatisfy: [ : each | each canBeEncroached ]