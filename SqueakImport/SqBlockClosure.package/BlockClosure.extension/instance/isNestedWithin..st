*SqKernel-testing
isNestedWithin: aContextOrBlock
	"Answer if the receiver is nested within aContextOrBlock, which may be ither a Context, or a BlockClosure."
	aContextOrBlock ifNotNil:
		[self outerContextsDo:
			[:ctxt|
			 (ctxt == aContextOrBlock
			  or: [ctxt closure = aContextOrBlock]) ifTrue: [^true]]].
	^false

