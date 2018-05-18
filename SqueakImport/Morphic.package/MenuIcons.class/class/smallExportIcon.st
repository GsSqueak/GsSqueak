private - icons
smallExportIcon
	"Private - Generated method"
	^ Icons
			at: #'smallExport'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallExportIconContents readStream) ].