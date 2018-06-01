*SqKernel-private
outerContextsDo: aBlock
	"Evaluate aBlock with all the outer contexts along the receiver's static chain."
	| outer |
	outer := outerContext.
	[outer notNil] whileTrue:
		[aBlock value: outer.
		 outer := outer closure ifNotNil: [:outerClosure| outerClosure outerContext]]

