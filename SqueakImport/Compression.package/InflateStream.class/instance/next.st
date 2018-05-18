accessing
next
	"Answer the next decompressed object in the Stream represented by the
	receiver."

	position >= readLimit
		ifTrue: [^self pastEndRead]
		ifFalse: [^collection at: (position := position + 1)]
