private - icons
smallLanguageIcon
	"Private - Generated method"
	^ Icons
			at: #'smallLanguage'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallLanguageIconContents readStream) ].