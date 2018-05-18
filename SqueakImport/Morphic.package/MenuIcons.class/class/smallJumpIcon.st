private - icons
smallJumpIcon
	"Private - Generated method"
	^ Icons
			at: #'smallJump'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallJumpIconContents readStream) ].