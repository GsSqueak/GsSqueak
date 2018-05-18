private - icons
smallNewIcon
	"Private - Generated method"
	^ Icons
			at: #'smallNew'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallNewIconContents readStream) ].