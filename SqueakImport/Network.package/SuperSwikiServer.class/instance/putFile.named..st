for real
putFile: fileStream named: fileNameOnServer

	
	^(
		self sendToSwikiProjectServer: {
			'uploadproject: ',fileNameOnServer convertToEncoding: self encodingName.
			'password: ',ProjectPasswordNotification signal.
			fileStream contentsOfEntireFile.
		}
	) beginsWith: 'OK'
