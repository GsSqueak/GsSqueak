public
superclass: aClass
	variableByteSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class in which the subclass is to 
	have indexable byte-sized nonpointer variables."
	| oldClassOrNil actualType env |
	(aClass instSize > 0)
		ifTrue: [^self error: 'cannot make a byte subclass of a class with named fields'].
	(aClass isVariable and: [aClass isWords])
		ifTrue: [^self error: 'cannot make a byte subclass of a class with word fields'].
	(aClass isVariable and: [aClass isPointers])
		ifTrue: [^self error: 'cannot make a byte subclass of a class with pointer fields'].
	oldClassOrNil := aClass environment at: t ifAbsent:[nil].
	actualType := (oldClassOrNil notNil
				   and: [oldClassOrNil typeOfClass == #compiledMethod])
					ifTrue: [#compiledMethod]
					ifFalse: [#bytes].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: actualType
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat