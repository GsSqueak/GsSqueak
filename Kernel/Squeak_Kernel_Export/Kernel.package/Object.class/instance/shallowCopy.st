copying
shallowCopy
	"Answer a copy of the receiver which shares the receiver's instance variables."
	| class newObject index |
	<primitive: 148 error: ec>
	ec == #'insufficient object memory' ifFalse:
		[^self primitiveFailed].
	class := self class.
	class isVariable
		ifTrue: 
			[index := self basicSize.
			 newObject := class basicNew: index.
			 [index > 0] whileTrue: 
				[newObject basicAt: index put: (self basicAt: index).
				 index := index - 1]]
		ifFalse: [newObject := class basicNew].
	index := class instSize.
	[index > 0] whileTrue: 
		[newObject instVarAt: index put: (self instVarAt: index).
		 index := index - 1].
	^newObject