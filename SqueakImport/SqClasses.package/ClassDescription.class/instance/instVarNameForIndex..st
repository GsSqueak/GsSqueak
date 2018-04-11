*SqClasses-instance variables
instVarNameForIndex: index
	"Answer the named instance variable with index index or nil if none."

	| superInstSize |
	index > self instSize ifTrue: [^nil].
	superInstSize := superclass isNil ifTrue: [0] ifFalse: [superclass instSize].
	index > superInstSize ifTrue:
		[^instanceVariables at: index - superInstSize].
	superclass isNil ifTrue: [^nil].
	^superclass instVarNameForIndex: index
