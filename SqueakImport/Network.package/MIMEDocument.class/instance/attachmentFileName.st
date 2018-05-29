accessing
attachmentFileName

	^ (self fieldNamed: 'content-disposition' ifAbsent: [^ ''])
		parameterAt: 'filename' ifAbsent: ['']  