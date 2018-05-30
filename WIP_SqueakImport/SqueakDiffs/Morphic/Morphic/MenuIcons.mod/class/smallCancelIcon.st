accessing - icons
smallCancelIcon
	"Private - Generated method"
	^ Icons
			at: #'smallCancel'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallCancelIconContents readStream) ].