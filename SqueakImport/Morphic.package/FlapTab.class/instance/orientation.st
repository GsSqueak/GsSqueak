access
orientation
	^ (#left == edgeToAdhereTo or: [#right == edgeToAdhereTo])
		ifTrue:		[#vertical]
		ifFalse:		[#horizontal]