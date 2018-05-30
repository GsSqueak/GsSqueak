serializing
asSendableBodyText

	| sendableBodyText |
	sendableBodyText := self isMultipart
		ifTrue: [self sendableMultipartBodyText]
		ifFalse: [(self isPlaintext or: [self isHTML]) 
					ifTrue: [self class tryToEncodeBody: self contents as: self charset]
					ifFalse: [self contents]].
	
	^ (self hasFieldNamed: 'content-transfer-encoding')
		ifFalse: [sendableBodyText]
		ifTrue: [ | transferEncoding |
			transferEncoding := self contentTransferEncoding.
			(MimeConverter forEncoding: transferEncoding) mimeEncode: sendableBodyText readStream ]  