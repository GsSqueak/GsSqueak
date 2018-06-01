private - icons
smallFullScreenIcon
	"Private - Generated method"
	^ Icons
			at: #'smallFullScreen'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallFullScreenIconContents readStream) ].