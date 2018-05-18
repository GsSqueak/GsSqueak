private - icons
smallPaintIcon
	"Private - Generated method"
	^ Icons
			at: #'smallPaint'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallPaintIconContents readStream) ].