private
readChunkType
	"Read a chunk ID string from the next 4 bytes."
	"Assume: Stream has at least four bytes left."

	| s |
	s := String new: 4.
	1 to: 4 do: [:i | s at: i put: (stream next) asCharacter].
	^ s
