accessing - icons
smallQuitIcon

	^ Icons
		at: #smallQuitIcon
		ifAbsentPut: [ self smallQuitIconContents ]