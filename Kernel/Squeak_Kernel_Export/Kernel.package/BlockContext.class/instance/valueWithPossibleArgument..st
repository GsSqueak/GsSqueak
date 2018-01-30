evaluating
valueWithPossibleArgument: anArg 

     "Evaluate the block represented by the receiver. 
     If the block requires one argument, use anArg, if it requires more than one,
     fill up the rest with nils."

	self numArgs = 0 ifTrue: [^self value].
	self numArgs = 1 ifTrue: [^self value: anArg].
	self numArgs  > 1 ifTrue: [^self valueWithArguments: {anArg}, (Array new: self numArgs  - 1)]