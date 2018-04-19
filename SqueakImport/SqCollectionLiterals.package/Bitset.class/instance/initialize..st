*SqCollectionLiterals-*SqCollectionLiterals-private
initialize: capacity
	"Capacity is expected to be a non-negative, multiple-of-eight integer."

	bytes := ByteArray new: capacity // 8.
	tally := 0
