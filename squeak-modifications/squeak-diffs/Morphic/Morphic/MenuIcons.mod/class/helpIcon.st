*Morphic-MorphicExtras-accessing - icons
helpIcon
	"Private - Generated method"
	^ Icons
			at: #'help'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self helpIconContents readStream) ].