system startup
initializeOldNetworkFlag
	"If the VM does not provide support for IPv6 primitives, or if the enable IPv6
	preference is not selected, then set a flag to force use of traditional IPv4
	network support. This limits network support to IPv4 and uses a four-element
	ByteArray rather than SocketAddress to represent network addresses."

	UseOldNetwork := self hasIpv6PrimSupport not or: [self enableIPv6 ~= true]