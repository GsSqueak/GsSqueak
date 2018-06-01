lookups
addressForName: hostName
	"NetNameResolver addressForName: 'impara.de' "
	"NetNameResolver addressForName: 'localhost' "
	"NetNameResolver addressForName: '127.0.0.1' "
	| addresses |
	self useOldNetwork
		ifTrue: [^self oldAddressForName: hostName].
	addresses := self addressesForName: hostName.
	^addresses
		ifEmpty: [nil]
		ifNotEmpty: [addresses first socketAddress]