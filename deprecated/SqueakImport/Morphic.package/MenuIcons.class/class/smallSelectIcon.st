private - icons
smallSelectIcon
	"Private - Generated method"
	^ Icons
			at: #'smallSelect'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallSelectIconContents readStream) ].