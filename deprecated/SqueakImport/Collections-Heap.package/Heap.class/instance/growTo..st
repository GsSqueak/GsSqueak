growing
growTo: newSize
	"Grow to the requested size."

	| newArray |
	newArray := Array new: (newSize max: tally).
	newArray replaceFrom: 1 to: tally with: array startingAt: 1.
	array := newArray