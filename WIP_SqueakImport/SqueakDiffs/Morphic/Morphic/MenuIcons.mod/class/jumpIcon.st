private - icons
jumpIcon
	"Private - Generated method"
	^ Icons
			at: #'jump'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self jumpIconContents readStream) ].