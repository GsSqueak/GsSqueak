private - icons
projectIcon
	"Private - Generated method"
	^ Icons
			at: #'project'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self projectIconContents readStream) ].