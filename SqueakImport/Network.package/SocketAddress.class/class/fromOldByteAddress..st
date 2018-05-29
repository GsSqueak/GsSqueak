instance creation
fromOldByteAddress: byteArray
	"Use the resolver to find a socket address corresponding to byteArray"

	| rs addrString addressInfos addressInfo |
	rs := ReadStream on: byteArray.
	addrString := String streamContents: [:strm | 
		[rs atEnd] whileFalse: [
			strm nextPutAll: rs next asString.
			rs atEnd ifFalse: [strm nextPut: $. ]]].
	addressInfos := NetNameResolver addressesForName: addrString.
	addressInfos isEmpty ifTrue: [self error: 'invalid address ', addrString].
	addressInfo := addressInfos
		detect: [:e | e addressFamilyName = #inet4]
		ifNone: [self error: 'no inet4 address for ', addrString].
	^addressInfo socketAddress "first available inet4 interface"
