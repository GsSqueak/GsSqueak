private
initializeStatesWith: anInteger
	"Initialize the states array with the seed."

	| seed |
	states := Array new: MTn.
	seed := anInteger.
	1 to: MTn do: [ :i | 
		states at: i put: (MTwordMask bitAnd: seed).
		seed := 16rFFFFFFFF bitAnd: (16r6C078965 * (seed bitXor: seed //  16r40000000 "bitShift: -30") + i) ]