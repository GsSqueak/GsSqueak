accessing
contentTypeHeaderValue

	^ self fieldNamed: 'content-type' ifAbsent: [self error: 'MIMEDocument requires a content-type field']