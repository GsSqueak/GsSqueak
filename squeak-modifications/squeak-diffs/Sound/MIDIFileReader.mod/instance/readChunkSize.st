private
readChunkSize
	"Read a 32-bit positive integer from the next 4 bytes, most significant byte first."
	"Assume: Stream has at least four bytes left."

	| n |
	n := 0.
	1 to: 4 do: [:ignore | n := (n bitShift: 8) + stream next].
	^ n
