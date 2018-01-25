arithmetic
\\\ anInteger 
	"A modulo method former used in DSA.
	This method is not much faster than \\ and rem: and it breaks some invariants (see super).
	Usage is now deprecated and should be reserved to backward compatibility."

	^(self digitDiv: anInteger neg: false) second