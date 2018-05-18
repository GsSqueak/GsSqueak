private - icons
fugueBroomIcon

	^ Icons
			at: #broom
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fugueBroomIconContents readStream) ].