private - icons
publishIcon
	"Private - Generated method"
	^ Icons
			at: #'publish'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self publishIconContents readStream) ].