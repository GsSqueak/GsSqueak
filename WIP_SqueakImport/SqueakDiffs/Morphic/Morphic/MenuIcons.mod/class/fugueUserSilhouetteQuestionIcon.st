private - icons
fugueUserSilhouetteQuestionIcon

	^ Icons
			at: #userSilhouetteQuestion
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fugueUserSilhouetteQuestionIconContents readStream) ].