private - icons
smallBackIcon
	"Private - Generated method"
	^ Icons
			at: #'smallBack'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallBackIconContents readStream) ].