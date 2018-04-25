*SqKernel-evaluating
valueWithPossibleArgument: anArg 
	"Evaluate the block represented by the receiver. 
	 If the block requires one argument, use anArg, if it requires more than one,
	 fill up the rest with nils."

	| a |
	self numArgs = 0 ifTrue: [^self value].
	self numArgs = 1 ifTrue: [^self value: anArg].
	a := Array new: self numArgs.
	a at: 1 put: anArg.
	^self valueWithArguments: a

