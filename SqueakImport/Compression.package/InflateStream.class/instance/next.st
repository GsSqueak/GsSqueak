accessing
next
	"Answer the next decompressed object in the Stream represented by the
	receiver."

	self notYetImplemented.
	position >= readLimit
		ifTrue: [^self pastEndRead]
		ifFalse: [^collection at: (position := position + 1)]