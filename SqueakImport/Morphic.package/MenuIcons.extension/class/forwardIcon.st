*Morphic-MorphicExtras-accessing - icons
forwardIcon
	"Private - Generated method"
	^ Icons
			at: #'forward'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self forwardIconContents readStream) ].