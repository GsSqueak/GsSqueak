printing/formatting
viewImageInBody
	| stream image |
	stream := self body contentStream.
	image := Form fromBinaryStream: stream.
	(Project current world drawingClass withForm: image) openInWorld