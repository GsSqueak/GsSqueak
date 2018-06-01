private - icons
windowIcon
	"Private - Generated method"
	^ Icons
			at: #'window'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self windowIconContents readStream) ].