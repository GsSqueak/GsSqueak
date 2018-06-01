image reading/writing
formFromStream: aBinaryStream
	"Answer a ColorForm stored on the given stream.  closes the stream"
	| reader readerClass form  |

	readerClass := self withAllSubclasses
		detect: [:subclass |
			aBinaryStream reset.
			subclass understandsImageFormat: aBinaryStream]
		ifNone: [
			aBinaryStream close.
			^self error: 'image format not recognized'].
	aBinaryStream reset.
	reader := readerClass new on: aBinaryStream.
	Cursor read showWhile: [
		form := reader nextImage.
		reader close].
	^ form
