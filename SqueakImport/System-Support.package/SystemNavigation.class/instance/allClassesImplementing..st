query
allClassesImplementing: aSelector  
	"Answer an collection of all classes that implement the message aSelector."

	| result |
	result := OrderedCollection new.
	self allBehaviorsDo: [ :behavior | 
		(behavior includesSelector: aSelector) ifTrue: [
			result add: behavior ] ].
	^result