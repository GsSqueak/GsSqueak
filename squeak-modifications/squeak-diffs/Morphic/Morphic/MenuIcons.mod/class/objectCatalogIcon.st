private - icons
objectCatalogIcon
	"Private - Generated method"
	^ Icons
			at: #'objectCatalog'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self objectCatalogIconContents readStream) ].