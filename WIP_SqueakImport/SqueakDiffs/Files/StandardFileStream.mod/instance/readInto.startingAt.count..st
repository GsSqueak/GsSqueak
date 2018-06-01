read, write, position
readInto: byteArray startingAt: startIndex count: count
	"Read into the given array as specified, and return the count
	actually transferred.  index and count are in units of bytes or
	longs depending on whether the array is Bitmap, String or ByteArray"
	
	| nRead newN newStartIndex |
	collection 
		ifNil: [ 
			newN := count.
			newStartIndex := startIndex ]
		ifNotNil: [
			byteArray class isBytes 
				ifFalse: [ 
					position < readLimit ifTrue: [ self flushReadBuffer ].
					newN := count.
					newStartIndex := startIndex ]
				ifTrue: [
					| available |
					(available := readLimit - position) > 0 
						ifFalse: [ available := 0 ]
						ifTrue: [
							| bufferedCount |
							bufferedCount := count min: available.
							byteArray
								replaceFrom: startIndex
								to: startIndex + bufferedCount - 1
								with: collection
								startingAt: position + 1.
							position := position + bufferedCount.
							bufferedCount = count ifTrue: [ ^count ] ].
					newN := count - available.
					newStartIndex := startIndex + available ] ].
	nRead := self primRead: fileID into: byteArray startingAt: newStartIndex count: newN.
	^nRead + (count - newN)