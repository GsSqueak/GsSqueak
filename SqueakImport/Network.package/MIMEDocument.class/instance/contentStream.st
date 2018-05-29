accessing
contentStream
	"Answer a RWBinaryOrTextStream on the contents."

	^ (RWBinaryOrTextStream with: self content) reset