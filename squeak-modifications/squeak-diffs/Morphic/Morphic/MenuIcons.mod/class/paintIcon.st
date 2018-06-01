private - icons
paintIcon
	"Private - Generated method"
	^ Icons
			at: #'paint'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self paintIconContents readStream) ].