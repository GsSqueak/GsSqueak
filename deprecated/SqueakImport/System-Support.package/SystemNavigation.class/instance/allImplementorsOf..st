query
allImplementorsOf: aSelector 
	"Answer a sorted collection of all the methods which are named aSelector."
	
	| result |
	result := OrderedCollection new.
	self allBehaviorsDo: [ :class |
		(class includesSelector: aSelector) ifTrue: [
			result add: (MethodReference class: class selector: aSelector) ] ].
	^result sort