accessing - icons
smallWindowIcon

	^ Icons
		at: #smallWindowIcon
		ifAbsentPut: [ self smallWindowIconContents ]