accessing - icons
smallRedoIcon

	^ Icons
		at: #smallRedoIcon
		ifAbsentPut: [ self smallRedoIconContents ]