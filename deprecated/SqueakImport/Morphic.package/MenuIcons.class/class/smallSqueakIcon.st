private - icons
smallSqueakIcon
	"Private - Generated method"
	^ Icons
			at: #'smallSqueak'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallSqueakIconContents readStream) ].