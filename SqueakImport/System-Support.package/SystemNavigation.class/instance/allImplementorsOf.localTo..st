query
allImplementorsOf: aSelector localTo: aClass 
	"Answer a sorted collection of all the methods that are named aSelector in, above, or below the given class."
	
	| result |
	result := OrderedCollection new.
	{ aClass theNonMetaClass. aClass theMetaClass } do: [ :baseClass |
		baseClass withAllSuperAndSubclassesDoGently: [ :class | 
			(class includesSelector: aSelector) ifTrue: [
				result add: (MethodReference class: class selector: aSelector) ] ] ].
	^result sort