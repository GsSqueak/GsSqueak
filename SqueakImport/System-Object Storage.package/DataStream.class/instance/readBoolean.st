write and read
readBoolean
	"PRIVATE -- Read the contents of a Boolean.
	 This is here only for compatibility with old data files."

	^ byteStream next ~= 0