private - icons
smallExpertIcon
	"Private - Generated method"
	^ Icons
			at: #'smallExpert'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallExpertIconContents readStream) ].