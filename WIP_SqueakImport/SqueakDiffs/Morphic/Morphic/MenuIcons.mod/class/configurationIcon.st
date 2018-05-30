private - icons
configurationIcon
	"Private - Generated method"
	^ Icons
			at: #'configuration'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self configurationIconContents readStream) ].