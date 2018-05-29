instance variables
instVarNameForIndex: index
	"Answer the named instance variable with index index or nil if none."

	| superInstSize |
	index > self instSize ifTrue: [^nil].
	superInstSize := superClass isNil ifTrue: [0] ifFalse: [superClass instSize].
	index > superInstSize ifTrue:
		[^ self instVarNames at: index - superInstSize].
	^ superClass ifNotNil: [:cls | cls instVarNameForIndex: index]
