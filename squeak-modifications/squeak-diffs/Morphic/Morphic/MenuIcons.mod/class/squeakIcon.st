private - icons
squeakIcon
	"Private - Generated method"
	^ Icons
			at: #'squeak'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self squeakIconContents readStream) ].