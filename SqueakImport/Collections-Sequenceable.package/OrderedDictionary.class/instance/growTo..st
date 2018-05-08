private
growTo: anInteger

	| oldOrder |
	super growTo: anInteger.
	oldOrder := order.
	"Grow only to 75%. See #atNewIndex:put: in HashedCollection."
	order := self class arrayType new: anInteger + 1 * 3 // 4.
	order
		replaceFrom: 1
		to: tally
		with: oldOrder
		startingAt: 1