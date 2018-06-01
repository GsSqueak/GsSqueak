system startup
hasIpv6PrimSupport
	"True if the VM includes the ipv6 primitives"
	^[NetNameResolver primHostNameSize. true]
		on: Error
		do: [false]
