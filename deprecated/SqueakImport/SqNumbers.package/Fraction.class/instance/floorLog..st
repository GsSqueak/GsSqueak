mathematical functions
floorLog: radix
	"Unlike super, this version is exact when radix is integer"
	
	| d n |
	radix isInteger ifFalse: [^super floorLog: 10].
	n := numerator floorLog: radix.
	d := denominator floorLog: radix.
	^(numerator * (radix raisedTo: d))
		< (denominator * (radix raisedTo: n))
		ifTrue: [n - d - 1]
		ifFalse: [n - d]