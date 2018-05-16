query
allCallsOnClass: aBehavior
	"Answer a sorted collection of all the methods that refer to aBehavior."
	
	| theClass result |
	theClass := aBehavior theNonMetaClass.
	result := self 
		allCallsOn: (
			self class thoroughSenders
				ifTrue: [  theClass name ]
				ifFalse: [ theClass environment bindingOf: theClass name ])
		fromBehaviors: self allBehaviors
		sorted: false.
	theClass environment allClassesDo: [ :class |
		(class sharedPools includes: theClass) ifTrue: [
			result add: (ClassReference class: class) ] ].
	^result sort