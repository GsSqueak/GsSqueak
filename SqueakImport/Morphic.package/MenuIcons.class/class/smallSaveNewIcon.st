accessing - icons
smallSaveNewIcon

	^ Icons
		at: #smallSaveNewIcon
		ifAbsentPut: [ self smallSaveNewIconContents ]