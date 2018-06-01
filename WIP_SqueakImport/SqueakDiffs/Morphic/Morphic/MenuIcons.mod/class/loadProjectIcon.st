private - icons
loadProjectIcon
	"Private - Generated method"
	^ Icons
			at: #'loadProject'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self loadProjectIconContents readStream) ].