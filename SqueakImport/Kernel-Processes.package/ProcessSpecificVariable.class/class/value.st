accessing
value
	"Answer the current value for this variable in the current context."
	^Processor activeProcess environmentAt: self ifAbsent: [self default].