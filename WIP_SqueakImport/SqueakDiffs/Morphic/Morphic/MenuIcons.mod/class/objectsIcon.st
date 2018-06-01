private - icons
objectsIcon
	"Private - Generated method"
	^ Icons
			at: #'objects'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self objectsIconContents readStream) ].