*network
httpPostMultipart: url args: argsDict
	| mimeBorder argsStream crLf resultStream result |
	" do multipart/form-data encoding rather than x-www-urlencoded "

	crLf := String crlf.
	mimeBorder := '----squeak-', Time millisecondClockValue printString, '-stuff-----'.
	"encode the arguments dictionary"
	argsStream := WriteStream on: String new.
	argsDict associationsDo: [:assoc |
		assoc value do: [ :value | | fieldValue |
		"print the boundary"
		argsStream nextPutAll: '--', mimeBorder, crLf.
		" check if it's a non-text field "
		argsStream nextPutAll: 'Content-disposition: form-data; name="', assoc key, '"'.
		(value isKindOf: MIMEDocument)
			ifFalse: [fieldValue := value]
			ifTrue: [argsStream nextPutAll: ' filename="', value url pathForFile, '"', crLf, 'Content-Type: ', value contentType.
				fieldValue := (value content
					ifNil: [(FileStream fileNamed: value url pathForFile) contentsOfEntireFile]
					ifNotNil: [value content]) asString].
" Transcript show: 'field=', key, '; value=', fieldValue; cr. "
		argsStream nextPutAll: crLf, crLf, fieldValue, crLf.
	]].
	argsStream nextPutAll: '--', mimeBorder, '--'.

	resultStream := self
		post: 
			('Content-type: multipart/form-data; boundary=', mimeBorder, crLf,
			'Content-length: ', argsStream contents size printString, crLf, crLf, 
			argsStream contents)
		url: url ifError: [^'Error in post ' url asString].
	"get the header of the reply"
	result := resultStream upToEnd.
	^MIMEDocument content: result