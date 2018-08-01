self-updating
didCodeChangeElsewhere
	"Determine whether the code for the currently selected method and class has been changed somewhere else."
	| aClass aSelector aCompiledMethod |
	currentCompiledMethod ifNil: [^ false].

	(aClass := self selectedClassOrMetaClass) ifNil: [^ false].

	(aSelector := self selectedMessageName) ifNil: [^ false].

	self classCommentIndicated
		ifTrue: [^ currentCompiledMethod ~~ aClass organization commentRemoteStr].

	^ (aCompiledMethod := aClass compiledMethodAt: aSelector ifAbsent: [^ false]) ~~ currentCompiledMethod
		and: [aCompiledMethod getSource = currentCompiledMethod getSource]
