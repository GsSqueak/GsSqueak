menu commands
encodeToWorkspace
	| stream encodedStream pict text |
	pict := formChoices at: currentIndex.
	stream := ByteArray new writeStream.
	PNGReadWriter putForm: pict onStream: stream.
	encodedStream := stream contents base64Encoded.
	text := Workspace open model.
	text contents: 'Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: ''', encodedStream,''' readStream)'