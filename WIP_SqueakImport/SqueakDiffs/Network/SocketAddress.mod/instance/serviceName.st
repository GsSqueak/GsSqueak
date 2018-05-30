accessing
serviceName

	| size name |
	NetNameResolver primGetNameInfo: self flags: 0.
	size := NetNameResolver primGetNameInfoServiceSize.
	name := String new: size.
	NetNameResolver primGetNameInfoServiceResult: name.
	^name