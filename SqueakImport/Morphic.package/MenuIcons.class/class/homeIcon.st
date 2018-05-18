private - icons
homeIcon
	"Private - Generated method"
	^ Icons
			at: #'home'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self homeIconContents readStream) ].