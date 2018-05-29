testing
isPowerOfTwo
	"Return true if the receiver is an integral power of two. Optimized version."
	
	| size |
	1 to: (size := self digitLength) do: [ :index |
		| digit |
		(digit := self digitAt: index) = 0 ifFalse: [ 
			^size = index and: [ digit isPowerOfTwo ] ] ].
	^false