private - icons
confirmIcon
	"Private - Generated method"
	^ Icons
			at: #'confirm'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self confirmIconContents readStream) ].