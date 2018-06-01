private - icons
smallVolumeIcon
	"Private - Generated method"
	^ Icons
			at: #'smallVolume'
			ifAbsentPut:[ Form fromBinaryStream: (Base64MimeConverter mimeDecodeToBytes: self smallVolumeIconContents readStream) ].