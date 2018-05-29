copying
deepCopy
	"Answer a copy of the receiver with its own copy of each instance variable.
	WARNING: deepCopy does not preserve object identities in cycles in the object graph. Consider using #veryDeepCopy instead."

	| newObject class index |
	class := self class.
	(class == Object) ifTrue: [^self].
	class isVariable
		ifTrue: 
			[index := self basicSize.
			newObject := class basicNew: index.
			[index > 0]
				whileTrue: 
					[newObject basicAt: index put: (self basicAt: index) deepCopy.
					index := index - 1]]
		ifFalse: [newObject := class basicNew].
	index := class instSize.
	[index > 0]
		whileTrue: 
			[newObject instVarAt: index put: (self instVarAt: index) deepCopy.
			index := index - 1].
	^newObject
