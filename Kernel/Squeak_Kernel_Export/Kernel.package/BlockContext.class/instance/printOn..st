printing
printOn: aStream
	| decompilation blockString truncatedBlockString |

	home == nil ifTrue: [^aStream nextPutAll: 'a BlockContext with home=nil'].
	aStream nextPutAll: '[] in '.
	super printOn: aStream.
	decompilation := [self decompile ifNil: ['--source missing--']]
						on: Error
						do: [:ex| ' (error in decompilation)'].
	blockString := ((decompilation isString
					ifTrue: [decompilation]
					ifFalse: [decompilation printString])
						replaceAll: Character cr with: Character space)
							replaceAll: Character tab with: Character space.
	truncatedBlockString := blockString truncateWithElipsisTo: 80.
	truncatedBlockString size < blockString size ifTrue:
		[truncatedBlockString := truncatedBlockString, ']}'].
	aStream space; nextPutAll: truncatedBlockString