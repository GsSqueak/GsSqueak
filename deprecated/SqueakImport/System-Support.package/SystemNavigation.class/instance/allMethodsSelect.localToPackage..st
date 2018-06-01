query
allMethodsSelect: aBlock localToPackage: packageNameOrInfo
	"Answer a sorted collection of each method in the given package for which the evaluation of aBlock with the method answers true."

	| result |
	result := OrderedCollection new.
	(self packageInfoFor: packageNameOrInfo) actualMethodsDo: [ :aMethod |
		(aBlock value: aMethod) ifTrue: [
			result add: aMethod methodReference ] ].
	^result sort