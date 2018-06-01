accessing - icons
smallCutIcon

	^ Icons
		at: #smallCutIcon
		ifAbsentPut: [ self smallCutIconContents ]