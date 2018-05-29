interactions
viewImage
	| stream image |
	stream := self contentStream.
	image := Form fromBinaryStream: stream.
	(Project current world drawingClass withForm: image) openInWorld