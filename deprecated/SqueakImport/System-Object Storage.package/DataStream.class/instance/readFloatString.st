write and read
readFloatString
	"PRIVATE -- Read the contents of a Float string.
	 This is the slow way to read a Float--via its string rep'n.
	 It's here for compatibility with old data files."

	^ Float readFrom: (byteStream next: (byteStream nextNumber: 4))