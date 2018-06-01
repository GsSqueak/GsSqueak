private
initialize: n
	"Initialize array to an array size of n"
	array := self class arrayType new: n.
	tally := 0