position
fractionalPosition
	"Return my player's costume's position including the fractional part.
	This allows the precise position to be retained to avoid cummulative
	rounding errors, while letting Morphic do all its calculations with
	integer pixel coordinates. See the implementation of forward:."
	^ fractionalPosition