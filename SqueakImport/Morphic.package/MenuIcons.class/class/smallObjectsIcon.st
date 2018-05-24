private - icons
smallObjectsIcon
	"Private - Generated method"
	^ Icons
			at: #'smallObjects'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallObjectsIconContents readStream) ].