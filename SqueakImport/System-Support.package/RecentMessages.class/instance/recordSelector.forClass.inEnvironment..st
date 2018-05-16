accessing
recordSelector: aSelector forClass: aClass inEnvironment: anEnvironment 
	| ref |
	(isSuspended = true or: [ aClass wantsChangeSetLogging not ]) ifTrue: [ ^ self ].
	ref := MethodReference
		class: aClass
		selector: aSelector
		environment: anEnvironment.
	methodReferences
		remove: ref
		ifAbsent: [  ].
	ref methodSymbol isDoIt ifFalse: [ methodReferences addFirst: ref ].
	self trim