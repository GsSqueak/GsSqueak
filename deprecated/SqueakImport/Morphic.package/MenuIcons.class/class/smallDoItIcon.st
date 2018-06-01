private - icons
smallDoItIcon
	"Private - Generated method"
	^ Icons
			at: #'smallDoIt'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallDoItIconContents readStream) ].