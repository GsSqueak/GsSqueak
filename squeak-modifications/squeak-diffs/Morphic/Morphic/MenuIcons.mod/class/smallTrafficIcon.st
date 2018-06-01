accessing - icons
smallTrafficIcon

	^ Icons
		at: #smallTrafficIcon
		ifAbsentPut: [ self smallTrafficIconContents ]