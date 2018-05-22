writing
isAReferenceType: typeID
	"Return true iff typeID is one of the classes that can be written as a reference to an instance elsewhere in the stream."

	"too bad we can't put Booleans in an Array literal"
	^ (RefTypes at: typeID) = 1
		"NOTE: If you get a bounds error here, the file probably has bad bits in it.  The most common cause is a file unpacking program that puts linefeeds after carriage returns."