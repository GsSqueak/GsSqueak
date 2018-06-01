multipart
makeMultipart
	"if I am not multipart already, then become a multipart message with one part"

	| newBody |

	body isMultipart ifTrue: [ ^self ].

	"set up the new message part"
	newBody := MIMEDocument newMultipart.
	newBody addPart: body.
	
	self setField: 'mime-version' to: (MIMEHeaderValue fromMIMEHeader: '1.0').

	body := newBody.