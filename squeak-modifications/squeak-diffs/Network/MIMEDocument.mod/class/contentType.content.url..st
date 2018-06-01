instance creation
contentType: aString  content: content  url: aUrl
	"create a MIMEObject with the given content-type and content"
	"MIMEObject contentType: 'text/plain' content: 'This is a test'"
	
	| ans |
	ans := self contentType: aString content: content.
	ans privateUrl: aUrl asUrl.
	^ans
