private
pvtAt: index
	"Private -- for swapping only"

	<primitive: 1072> "GemStone Primitive"
	index isInteger ifTrue: [self errorSubscriptBounds: index].
	index isNumber ifTrue: [^ self at: index truncated].
	self errorNonIntegerIndex.
