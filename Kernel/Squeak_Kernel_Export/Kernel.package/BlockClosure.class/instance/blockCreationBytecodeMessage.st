scanning
blockCreationBytecodeMessage
	"Answer the abstract bytecode message that created the receiver."
	^self method abstractBytecodeMessageAt: self blockCreationPC

	"(SortedCollection sortBlock: [:a :b| a compare: b caseSensitive: false]) sortBlock blockCreationBytecodeMessage"