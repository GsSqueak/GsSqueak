private - icons
smallForwardIcon
	"Private - Generated method"
	^ Icons
			at: #'smallForward'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallForwardIconContents readStream) ].