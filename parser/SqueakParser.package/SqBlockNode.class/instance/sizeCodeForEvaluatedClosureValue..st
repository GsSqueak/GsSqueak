code generation
sizeCodeForEvaluatedClosureValue: encoder 
	"The closure value primitives push the arguments and the copied
	values. The compiler guarantees that any copied values come before
	all local temps.
	So on closure activation we only need to push nils for the remaining
	temporaries."
	^ (encoder sizePushNClosureTemps: temporaries size)
		+ (self
				reindexingLocalsDo: [self sizeCodeForEvaluatedValue: encoder]
				encoder: nil)
		+ (self returns
				ifTrue: ["don't store temps yet"
					0]
				ifFalse: [encoder sizeReturnTopToCaller])