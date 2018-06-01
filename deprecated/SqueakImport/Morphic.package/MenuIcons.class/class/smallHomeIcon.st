accessing - icons
smallHomeIcon

	^ Icons
		at: #smallHomeIcon
		ifAbsentPut: [ self smallHomeIconContents ]