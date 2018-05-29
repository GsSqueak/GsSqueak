system attributes
calcEndianness
	"What endian-ness is the current hardware?  The String '1234' will be stored into a machine word.  On BigEndian machines (the Mac), $1 will be the high byte if the word.  On LittleEndian machines (the PC), $4 will be the high byte."
	"Smalltalk endianness"
	| wordThenBytes |
	wordThenBytes := WordArray with: 16r01020304.
	ByteArray adoptInstance: wordThenBytes.
	wordThenBytes first = 1 ifTrue: [^#big].
	wordThenBytes first = 4 ifTrue: [^#little].
	self error: 'The author is confused'
