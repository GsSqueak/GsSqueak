query
allImplementorsOf: aSelector  localToPackage: packageNameOrInfo
	"Answer a sorted collection of all the methods named aSelector in the given package."

	| result |
	result := OrderedCollection new.
	(self packageInfoFor: packageNameOrInfo) actualMethodsDo: [ :method |
		method selector = aSelector ifTrue: [
			result add: method methodReference ] ].
	^result sort