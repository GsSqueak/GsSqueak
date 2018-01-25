evaluating
valueWithPossibleArgs: anArray 

     "Evaluate the block represented by the receiver. 
     If the block requires arguments, take them from anArray. If anArray is too
     large, the rest is ignored, if it is too small, use nil for the other arguments"
 
	self numArgs = 0 ifTrue: [^self value].
	self numArgs = anArray size ifTrue: [^self valueWithArguments: anArray].
	self numArgs > anArray size ifTrue: [
		^self valueWithArguments: anArray,
				(Array new: (self numArgs - anArray size))
	].
	^self valueWithArguments: (anArray copyFrom: 1 to: self numArgs)

