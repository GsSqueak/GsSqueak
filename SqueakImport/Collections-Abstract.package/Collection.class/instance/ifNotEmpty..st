testing
ifNotEmpty: aBlock
	"Evaluate the given block unless the receiver is empty.

      If the block has an argument, eval with the receiver as its argument,
      but it might be better to use ifNotEmptyDo: to make the code easier to
      understand"

	self isEmpty ifFalse: [^ aBlock valueWithPossibleArgument: self].
