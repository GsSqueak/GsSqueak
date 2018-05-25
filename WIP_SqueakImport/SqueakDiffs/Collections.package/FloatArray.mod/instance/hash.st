comparing
hash
	| result |
	
	result := 0.
	1 to: self size do:[:i| result := result + (self basicAt: i) ].
	^result bitAnd: 16r1FFFFFFF