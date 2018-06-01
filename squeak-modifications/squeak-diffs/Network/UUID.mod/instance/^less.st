comparing
< aMagnitude 
	"Answer whether the receiver is less than the argument."

	1 to: self size do: [ :i |
		| x y |
		(x := self at: i) = (y := aMagnitude at: i) ifFalse: [ ^x < y ] ].
	^false.