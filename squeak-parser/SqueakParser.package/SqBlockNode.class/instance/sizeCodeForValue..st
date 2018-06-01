code generation
sizeCodeForValue: encoder 
	"Compute the size for the creation of the block and its code."
	copiedValues := self computeCopiedValues: encoder rootNode.
	self ensureClosureCreationNode.
	"Remember size of body for emit time so we know the size of the jump
	around it."
	size := self sizeCodeForEvaluatedClosureValue: encoder.
	^ (copiedValues
		inject: 0
		into: [:sum :node | sum
				+ (node sizeCodeForValue: encoder)])
		+ (encoder
				sizePushClosureCopyNumCopiedValues: copiedValues size
				numArgs: arguments size
				jumpSize: size) + size