private
nextSocketAddressInformation

	| addrSize addr info |
	addrSize := self primGetAddressInfoSize.
	addrSize < 0 ifTrue: [^nil].
	addr := SocketAddress new: addrSize.
	self primGetAddressInfoResult: addr.
	info := SocketAddressInformation
		withSocketAddress: addr
		family: self primGetAddressInfoFamily
		type: self primGetAddressInfoType
		protocol: self primGetAddressInfoProtocol.
	self primGetAddressInfoNext.
	^info