stdio
encodeAndDecodeStdioFiles
	
	<preference: 'Encode and decode the contents of stdio files.'
		category: 'Files'
		description: 'It true, then the contents of stdin, stdout and stderr are encoded/decoded using the system default text converter.'
		type: #Boolean>
	^EncodeAndDecodeStdioFiles ifNil: [ true ]