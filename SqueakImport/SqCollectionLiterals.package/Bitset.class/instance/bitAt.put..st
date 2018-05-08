bit manipulation
bitAt: anInteger put: aBit
	"Set the value corresponding to anInteger to aBit. Return the new value."

	aBit caseOf: {
		[ 0 ] -> [ self clearBitAt: anInteger ].
		[ 1 ] -> [ self setBitAt: anInteger ] }.
	^aBit
		
		
