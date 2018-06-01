private - icons
smallUpdateIcon
	"Private - Generated method"
	^ Icons
			at: #'smallUpdate'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallUpdateIconContents readStream) ].