public
superclass: aClass
	ephemeronSubclass: t instanceVariableNames: f 
	classVariableNames: d poolDictionaries: s category: cat
	"This is the standard initialization message for creating a new class as a 
	subclass of an existing class (the receiver) in which the subclass is to 
	have ephemeron semantics, i.e. where the object will be queued for
	finalization when the key (first) inst var is not reachable other than through
	the other fields of ephemerons with unreachable keys."
	| env |
	aClass isPointers ifFalse:
		[^self error: 'cannot make a pointer subclass of a class with non-pointer fields'].
	aClass instSize + (f subStrings: ' 	\' withCRs) size < 2 ifTrue:
		[^self error: 'cannot make an ephemeron class with less than two named instance varaibles'].
	env := CurrentEnvironment signal ifNil: [aClass environment].
	^self 
		name: t
		inEnvironment: env
		subclassOf: aClass
		type: #ephemeron
		instanceVariableNames: f
		classVariableNames: d
		poolDictionaries: s
		category: cat