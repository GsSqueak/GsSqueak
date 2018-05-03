constants
size4Bit
	"One of the base header word bit fields. The 4 bit is excluded from sizeMask for
	64-bit object memory, but need it for ST size.
	Note SizeMask + Size4Bit gives the mask needed for size fits of format word in classes.
	This is used in instantiateClass:indexableSize: "

	<inline: true>
	^self
		cCode: 'SIZE_4_BIT'
		inSmalltalk: [self bytesPerWord = 4
			ifTrue: [0]
			ifFalse: [4]]
