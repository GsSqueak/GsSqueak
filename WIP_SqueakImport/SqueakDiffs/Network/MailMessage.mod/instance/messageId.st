accessing
messageId

	^ (self fieldNamed: 'message-id' ifAbsent: [ ^'' ])  mainValue