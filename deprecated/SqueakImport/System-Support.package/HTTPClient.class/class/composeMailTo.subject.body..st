utilities
composeMailTo: address subject: subject body: body
	"HTTPClient composeMailTo: 'michael.rueger@squeakland.org' subject: 'test subject' body: 'message' "
	| mailTo |
	mailTo := WriteStream on: String new.
	mailTo nextPutAll: 'mailto:'.
	mailTo
		nextPutAll: address;
		nextPut: $?.
	subject isEmptyOrNil
		ifFalse: [mailTo nextPutAll: 'subject='; nextPutAll: subject; nextPut: $&].
	body isEmptyOrNil
		ifFalse: [mailTo nextPutAll: 'body='; nextPutAll: body].

	self httpGet: mailTo contents