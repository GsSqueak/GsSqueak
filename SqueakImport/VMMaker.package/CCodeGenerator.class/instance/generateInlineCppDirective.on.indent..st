C translation
generateInlineCppDirective: msgNode on: aStream indent: level
	"Generate the C code for this message onto the given stream."

	aStream cr; nextPutAll: '# ', msgNode args first value.