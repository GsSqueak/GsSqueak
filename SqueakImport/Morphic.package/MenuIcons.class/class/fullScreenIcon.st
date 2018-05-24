private - icons
fullScreenIcon
	"Private - Generated method"
	^ Icons
			at: #'fullScreen'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self fullScreenIconContents readStream) ].