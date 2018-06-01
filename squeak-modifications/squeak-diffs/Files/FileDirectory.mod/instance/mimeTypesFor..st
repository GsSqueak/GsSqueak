file operations
mimeTypesFor: fileName
	"Return a list of MIME types applicable to the receiver. This default implementation uses the file name extension to figure out what we're looking at but specific subclasses may use other means of figuring out what the type of some file is. Some systems like the macintosh use meta data on the file to indicate data type"

	| idx ext dot |
	ext := ''.
	dot := self class extensionDelimiter.
	idx := fileName findLast: [:ch| ch = dot].
	idx = 0 ifFalse: [ext := fileName copyFrom: idx+1 to: fileName size].
	^ StandardMIMEMappings at: ext asLowercase ifAbsent: [nil]