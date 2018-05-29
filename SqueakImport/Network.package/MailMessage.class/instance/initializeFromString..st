initialize-release
initializeFromString: aString 
	"Parse aString to initialize myself."

	| parseStream contentType bodyText contentTransferEncoding |

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

	body := MIMEDocument contentType: contentType content: bodyText