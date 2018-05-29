*network-uri
retrieveMIMEDocument: uri
	| file |
	file  := [self contentStreamForURI: uri] 
			on: FileDoesNotExistException do:[:ex| ex return: nil].
	file ifNotNil: [^MIMEDocument contentType: (MIMEDocument guessTypeFromName: uri) content: file contents url: uri].
	^nil