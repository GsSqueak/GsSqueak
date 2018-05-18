access
next
	self notYetImplemented.
	position >= readLimit
		ifTrue: [^ (self next: 1) at: 1]
		ifFalse: [^ collection at: (position := position + 1)]