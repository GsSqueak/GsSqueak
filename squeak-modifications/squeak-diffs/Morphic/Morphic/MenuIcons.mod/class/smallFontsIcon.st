accessing - icons
smallFontsIcon
	"Private - Generated method"
	^ Icons
			at: #'smallFonts'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallFontsIconContents readStream) ].