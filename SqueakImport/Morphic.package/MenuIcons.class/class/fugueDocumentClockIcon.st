private - icons
fugueDocumentClockIcon

	^ Icons
			at: #documentClock
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fugueDocumentClockIconContents readStream) ].