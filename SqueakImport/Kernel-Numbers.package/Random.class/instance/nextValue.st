private
nextValue
	"Answer an MTw-bit random integer between 0 and wordMask, and increment the index."

	| y |
	y := states at: index.
	(index := index + 1) > MTn ifTrue: [ self generateStates ].
	y := y bitXor: (y bitShift: MTu).
	y := ((y bitAnd: MTbShifted) bitShift: MTs) bitXor: y.
	y := ((y bitAnd: MTcShifted) bitShift: MTt) bitXor: y.
	y := (y bitShift: MTl) bitXor: y.
	^y