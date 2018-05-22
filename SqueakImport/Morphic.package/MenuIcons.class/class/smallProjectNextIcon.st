accessing - icons
smallProjectNextIcon

	^ Icons
		at: #smallProjectNextIcon
		ifAbsentPut: [ self smallProjectNextIconContents ]