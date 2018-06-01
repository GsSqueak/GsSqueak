*SqNumbers-mathematical functions
floorLog: radix
	"Unlike super, this version is exact when radix is integer"
	
	^self asFraction floorLog: radix
