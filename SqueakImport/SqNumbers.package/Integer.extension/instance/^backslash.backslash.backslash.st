*SqNumbers-arithmetic
\\\ anInteger 
	"A modulo method former used in DSA."
	
	"Notes: this method used to be a faster than \\ for LargeIntegers, but this advantage is fainting:
	- it always was slower for SmallInteger because of the indirection below
	- a new LargeInteger primitive makes \\ faster up to 64 bits operands
	- even above 64 bits, its advantage has become marginal thanks to revised \\ primitive fallback code
	Moreover, \\\ behaviour is questionable for these reasons:
	- for a negative receiver xor argument, it behaves like rem: for LargeInteger and \\ for SmallInteger
	- it may answer a not normalized LargeInteger (with leading null digits) which breaks some invariants
	For example, check (SmallInteger maxVal + 1 \\\ 8) isZero.
	So beware if you ever think using this method."

	^self \\ anInteger