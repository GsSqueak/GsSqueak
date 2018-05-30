private
next16BitWord
	"Read a 16-bit positive integer from the input stream, most significant byte first."
	"Assume: Stream has at least two bytes left."

	| n |
	n := stream next.
	^ (n bitShift: 8) + stream next
