public
superclass: aClass
	variableSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class in which the subclass is to 
	have indexable pointer variables."
	
	| env |
	aClass isBits ifTrue: 
		[^self error: 'cannot make a pointer subclass of a class with non-pointer fields'].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: #variable
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat