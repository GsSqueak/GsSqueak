as yet unclassified
decodeInteger: mimeString
	| bytes sum |
	"Decode the MIME string into an integer of any length"

	bytes := (Base64MimeConverter mimeDecodeToBytes: 
				(ReadStream on: mimeString)) contents.
	sum := 0.
	bytes reverseDo: [:by | sum := sum * 256 + by].
	^ sum