multipart
addAttachmentFrom: aStream withName: aName
	"add an attachment, encoding with base64.  aName is the optional filename"
	| newPart |
	self makeMultipart.

	newPart := MIMEDocument contentType: (MIMEDocument guessTypeFromName: aName) content: ''.
	newPart setField: 'content-transfer-encoding' toString: 'base64'.
	newPart setField: 'content-disposition' toString: 'attachment'.
	
	aName ifNotNil: [
		| dispositionField contentTypeField |
		dispositionField := newPart fieldNamed: 'content-disposition' 
			ifAbsent: [self error: 'Should be initialized by now'].
		dispositionField parameterAt: 'filename' put: '"' , aName , '"'.
		
		contentTypeField := newPart fieldNamed: 'content-type' 
			ifAbsent: [self error: 'Should be initialized by now'].
		contentTypeField parameterAt: 'name' put: '"' , aName , '"'.].
	
	newPart content: aStream upToEnd.
	self body addPart: newPart.