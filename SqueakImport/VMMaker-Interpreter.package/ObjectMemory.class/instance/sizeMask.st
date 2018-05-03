constants
sizeMask
	"One of the base header word bit fields. For 64-bit word size, lose the 4 bit
	in temp 64-bit chunk format. See size4Bit, which restores the 4 bit ST size.
	Note SizeMask + Size4Bit gives the mask needed for size fits of format word in classes.
	This is used in instantiateClass:indexableSize: "

	<inline: true>
	^self
		cCode: 'SIZE_MASK'
		inSmalltalk: [self bytesPerWord = 4
			ifTrue: [16rFC]
			ifFalse: [16rF8  "Lose the 4 bit in temp 64-bit chunk format"]]
