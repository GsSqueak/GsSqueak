private - icons
smallInspectItIcon
	"Private - Generated method"
	^ Icons
			at: #'smallInspectIt'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallInspectItIconContents readStream) ].