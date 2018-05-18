*Compression-Streams
viewGZipContents
	"View the contents of a gzipped file"

	| stringContents |
	self binary.
	stringContents := self contentsOfEntireFile.
	stringContents := (GZipReadStream on: stringContents) upToEnd.
	^ stringContents asString withSqueakLineEndings.