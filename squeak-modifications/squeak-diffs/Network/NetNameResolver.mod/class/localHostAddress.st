lookups
localHostAddress
	"Return the local address of this host."
	"NetNameResolver localHostAddress"

	self useOldNetwork ifTrue: [
		self initializeNetwork.
		^self primLocalAddress ].
	^NetNameResolver addressForName: self localHostName