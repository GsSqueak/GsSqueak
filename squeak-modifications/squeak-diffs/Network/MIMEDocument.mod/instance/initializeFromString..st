initialize-release
initializeFromString: aString
	"This can only be used for MIME documents which are not multipart."

	| parseStream contentType bodyText contentTransferEncoding text |

	text := aString withoutTrailingBlanks, String cr, String cr.
	parseStream := ReadStream on: text.
	contentType := 'text/plain'.
	contentTransferEncoding := nil.
	fields := Dictionary new.

	"Extract information out of the header fields"
	self fieldsFrom: parseStream do: 
		[:fName :fValue | 
		"NB: fName is all lowercase"

		fName = 'content-type' ifTrue: [contentType := fValue asLowercase].
		fName = 'content-transfer-encoding' ifTrue: [contentTransferEncoding := fValue asLowercase].

		(fields at: fName ifAbsentPut: [OrderedCollection new: 1])
			add: (MIMEHeaderValue forField: fName fromString: fValue)].

	"Extract the body of the message"
	bodyText := parseStream upToEnd.
	bodyText := (MimeConverter forEncoding: contentTransferEncoding) 
		mimeDecode: (ReadStream on: bodyText) as: String.
	bodyText := self class tryToDecodeBody: bodyText as: self charset.
	
	self isMultipart
		ifTrue: [parts := self class parseParts: bodyText withSeparator: self attachmentSeparator]
		ifFalse: [content := bodyText]
	