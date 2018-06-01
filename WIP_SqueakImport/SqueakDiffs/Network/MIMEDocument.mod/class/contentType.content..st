instance creation
contentType: aString content: content
	"create a MIMEObject with the given content-type and content"
	"MIMEDocument contentType: 'text/plain' content: 'This is a test'"
	
	| ans |
	
	ans := self new.

	ans contentTypeHeaderValue: (MIMEHeaderValue fromMIMEHeader: aString).

	(ans isPlaintext or: [ans isHTML])
		ifTrue:  [ans content: (self tryToDecodeBody: content as: ans charset)]
		ifFalse: [ans isMultipart
					ifTrue: [| separator |
						separator := ans attachmentSeparator asLowercase.
						separator ifNil: [self error: 'Bad attachment separater'].

						separator := '--', separator withoutTrailingBlanks.
						ans addAllParts: (self parseParts: content withSeparator:separator).]
					ifFalse: [ans content: content]].
		
	^ ans
