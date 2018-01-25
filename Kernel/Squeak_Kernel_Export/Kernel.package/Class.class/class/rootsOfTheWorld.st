inquiries
rootsOfTheWorld
	"return a collection of classes which have a nil superclass"
	^(Smalltalk globals select: [:each | each isBehavior and: [each superclass isNil]]) asOrderedCollection