lookups
localAddressString
	"Return a string representing the local host address as four decimal bytes delimited with decimal points."
	"NetNameResolver localAddressString"

	self useOldNetwork
		ifTrue: [^self stringFromAddress: self primLocalAddress].
	^self localHostAddress hostNumber