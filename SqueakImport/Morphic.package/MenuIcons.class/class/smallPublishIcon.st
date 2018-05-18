private - icons
smallPublishIcon
	"Private - Generated method"
	^ Icons
			at: #'smallPublish'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallPublishIconContents readStream) ].