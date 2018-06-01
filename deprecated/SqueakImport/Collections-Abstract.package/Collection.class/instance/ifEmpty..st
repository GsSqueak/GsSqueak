testing
ifEmpty: aBlock
	"Evaluate the block if I'm empty"

	self isEmpty ifTrue: [ ^aBlock value ]