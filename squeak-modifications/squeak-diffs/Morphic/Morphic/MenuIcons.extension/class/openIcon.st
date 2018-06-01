*Morphic-MorphicExtras-accessing - icons
openIcon
	"Private - Generated method"
	^ Icons
			at: #'open'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self openIconContents readStream) ].