contexts
context: thisCntx hasSender: aContext 
	"Does thisCntx have aContext in its sender chain?"
	| s nilOop |
	<inline: true>
	thisCntx == aContext ifTrue: [^false].
	nilOop := objectMemory getNilObj.
	s := objectMemory fetchPointer: SenderIndex ofObject: thisCntx.
	[s == nilOop]
		whileFalse: [s == aContext ifTrue: [^true].
			s := objectMemory fetchPointer: SenderIndex ofObject: s].
	^false