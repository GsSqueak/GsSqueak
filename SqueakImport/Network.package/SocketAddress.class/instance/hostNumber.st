accessing
hostNumber

	| size name |
	NetNameResolver primGetNameInfo: self flags: 1.
	size := NetNameResolver primGetNameInfoHostSize.
	name := String new: size.
	NetNameResolver primGetNameInfoHostResult: name.
	^name