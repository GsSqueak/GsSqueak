private - icons
smallRemoteOpenIcon
	"Private - Generated method"
	^ Icons
			at: #'smallRemoteOpen'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallRemoteOpenIconContents readStream) ].