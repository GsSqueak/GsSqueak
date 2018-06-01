private - icons
volumeIcon
	"Private - Generated method"
	^ Icons
			at: #'volume'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self volumeIconContents readStream) ].