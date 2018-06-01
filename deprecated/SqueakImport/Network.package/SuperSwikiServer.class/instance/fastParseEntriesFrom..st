for real
fastParseEntriesFrom: aString

	| c first |

	c := OrderedCollection new.
	first := true.
	aString linesDo: [ :x | | xEntryName ch xIsDirectory strm xCreationTime xModificationTime xFileSize |
		first ifFalse: [
			strm := ReadStream on: x.
			(strm upTo: $ ) = '(DirectoryEntry' ifFalse: [^nil].
			(strm upTo: $ ) = 'name:' ifFalse: [^nil].
			xEntryName := WriteStream on: String new.
			strm next = $' ifFalse: [^nil].
			[
				ch := strm next.
				ch = $' and: [(strm peekFor: $') not]
			] whileFalse: [
				xEntryName nextPut: ch.
			].
			xEntryName := xEntryName contents.
			strm skipSeparators.
			(strm upTo: $ ) = 'creationTime:' ifFalse: [^nil].
			xCreationTime := (strm upTo: $ ) asNumber.
			(strm upTo: $ ) = 'modificationTime:' ifFalse: [^nil].
			xModificationTime := (strm upTo: $ ) asNumber.
			(strm upTo: $ ) = 'isDirectory:' ifFalse: [^nil].
			xIsDirectory := (strm upTo: $ ) = 'true'.
			(strm upTo: $ ) = 'fileSize:' ifFalse: [^nil].
			xFileSize := (strm upTo: $ ) asNumber.

			c add: (DirectoryEntry 
				name: (xEntryName convertFromEncoding: self encodingName)
				creationTime: xCreationTime 
				modificationTime: xModificationTime 
				isDirectory: xIsDirectory 
				fileSize: xFileSize
			)
		].
		first := false.
	].
	^c
