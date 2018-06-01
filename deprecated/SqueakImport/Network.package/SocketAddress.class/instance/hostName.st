accessing
hostName

	| size name |
	NetNameResolver primGetNameInfo: self flags: 0.
	size := NetNameResolver primGetNameInfoHostSize.
	name := String new: size.
	NetNameResolver primGetNameInfoHostResult: name.
	^name