lookups
localHostName
	"Return the local name of this host."
	"NetNameResolver localHostName"

	| host |
	self useOldNetwork ifTrue: [
		| hostName |
		hostName := self
			nameForAddress: self localHostAddress
			timeout: 5.
		^hostName ifNil: [ self localAddressString ] ].
	host := String new: NetNameResolver primHostNameSize.
	NetNameResolver primHostNameResult: host.
	^host