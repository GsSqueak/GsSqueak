accessing
frameSize
	"Answer the size of temporary frame needed to run the receiver."
	"NOTE: Versions 2.7 and later use two sizes of contexts."
	(self header noMask: 131072)
		ifTrue: [^ SmallFrame]
		ifFalse: [^ LargeFrame]