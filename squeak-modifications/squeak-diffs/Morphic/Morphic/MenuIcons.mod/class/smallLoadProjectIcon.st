private - icons
smallLoadProjectIcon
	"Private - Generated method"
	^ Icons
			at: #'smallLoadProject'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallLoadProjectIconContents readStream) ].