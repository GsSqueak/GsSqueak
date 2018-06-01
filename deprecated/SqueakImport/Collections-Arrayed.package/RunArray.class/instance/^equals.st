comparing
= anObject 
	"Test if all my elements are equal to those of anObject"

	^anObject class == self class
		ifTrue: "Faster test between two RunArrays"
			[(runs hasEqualElements: anObject runs)
			 and: [values hasEqualElements: anObject values]]
		ifFalse:
			[anObject isCollection and: [self hasEqualElements: anObject]]