primitives
primitiveAsyncFileWriteStart: fHandle fPosition: fPosition fromBuffer: buffer at: start count: num 
	| f bufferSize bufferPtr count startIndex |
	<var: #f type: 'AsyncFile *'>
	<var: #bufferPtr type: 'char *'>
	self primitive: 'primitiveAsyncFileWriteStart' parameters: #(Oop SmallInteger Oop SmallInteger SmallInteger ).
	f := self asyncFileValueOf: fHandle.
	interpreterProxy failed ifTrue: [^ nil].

	count := num.
	startIndex := start.
	bufferSize := interpreterProxy slotSizeOf: buffer.	"in bytes or words"
	(interpreterProxy isWords: buffer)
		ifTrue: ["convert word counts to byte counts"
			count := count * self bytesPerWord.
			startIndex := startIndex - 1 * self bytesPerWord + 1.
			bufferSize := bufferSize * self bytesPerWord].
	interpreterProxy success: (startIndex >= 1 and: [startIndex + count - 1 <= bufferSize]).
	bufferPtr := self bufferPointer: buffer startIndex: startIndex.
	interpreterProxy failed ifFalse: [self cCode: 'asyncFileWriteStart(f, fPosition, bufferPtr, count)']