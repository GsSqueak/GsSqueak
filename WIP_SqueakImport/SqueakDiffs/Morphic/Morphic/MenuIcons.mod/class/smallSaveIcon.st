accessing - icons
smallSaveIcon

	^ Icons
		at: #smallSaveIcon
		ifAbsentPut: [ self smallSaveIconContents ]