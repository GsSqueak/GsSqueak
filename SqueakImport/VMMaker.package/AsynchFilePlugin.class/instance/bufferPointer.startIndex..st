primitives
bufferPointer: buffer startIndex: startIndex
 	"Adjust for zero-origin indexing. This is implemented as a separate method in order
	to encourage inlining."

	<inline: true>
	<returnTypeC: 'char *'>
	^ (self pointerForOop: buffer) + self baseHeaderSize + startIndex - 1.
