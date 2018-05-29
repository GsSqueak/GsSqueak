accessing
serviceNumber

	| size name |
	NetNameResolver primGetNameInfo: self flags: 1.
	size := NetNameResolver primGetNameInfoServiceSize.
	name := String new: size.
	NetNameResolver primGetNameInfoServiceResult: name.
	^name