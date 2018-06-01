accessing
contentTransferEncodingHeaderValue

	^ self fieldNamed: 'content-transfer-encoding' ifAbsent: [nil]