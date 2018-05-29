primitives-ipv6
primGetNameInfo: socketAddress flags: flags

	self notYetImplemented.
	flags == 0 ifTrue: [^self primGetNameInfo: socketAddress
						flags: SocketAddressInformation numericFlag].
	self primitiveFailed