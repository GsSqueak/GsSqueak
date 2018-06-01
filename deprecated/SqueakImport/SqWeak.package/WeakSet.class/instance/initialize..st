private
initialize: n
	"Initialize array to an array size of n"

	super initialize: n.
	flag := Object new.
	array atAllPut: flag